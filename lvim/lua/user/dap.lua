local M = {}

M.config = function()
  local dap = require('dap')

  local function sanitize_command_for_debugging(command)
    if command[1] == "run" then
      command[1] = "build"
    elseif command[1] == "test" then
      table.insert(command, 2, "--no-run")
    end
  end

  local function get_command(c, result)
    local ret = {}
    local args = result[c].args
    local dir = args.workspaceRoot

    ret = vim.list_extend({}, args.cargoArgs or {})
    ret = vim.list_extend(ret, args.cargoExtraArgs or {})
    table.insert(ret, "--")
    ret = vim.list_extend(ret, args.executableArgs or {})

    return "cargo", ret, dir
  end

  local function get_cargo_args_from_runable_args(args)
    local cargo_args = args.cargoArgs
    local message_json = "--message-format=json"

    if not vim.tbl_contains(cargo_args, message_json) then
      table.insert(cargo_args, message_json)
    end

    for _, value in ipairs(args.cargoExtraArgs) do
      if not vim.tbl_contains(cargo_args, value) then
        table.insert(cargo_args, value)
      end
    end

    return cargo_args
  end

  local function scheduled_error(err)
    vim.schedule(function()
      vim.notify(err, vim.log.levels.ERROR)
    end)
  end

  local function start_debug(args)
    local Job = require('plenary.job')
    local cargo_args = get_cargo_args_from_runable_args(args)

    vim.notify("Compiling a debug for debugging, please wait...")

    Job:new({
      command = "cargo",
      args = cargo_args,
      cwd = args.workspaceRoot,
      on_exit = function(j, code)
        if code and code > 0 then
          scheduled_error("Compilation failed, unable to start debugging")
          return
        end
        vim.schedule(function()
          local executables = {}

          for _, value in pairs(j:result()) do
            local artifact = vim.fn.json_decode(value)

            if type(artifact) ~= "table" or artifact.reason ~= "compiler-artifact" then
              goto continue
            end

            local is_binary = vim.tbl_contains(artifact.target.crate_types, "bin")
            local is_build_script = vim.tbl_contains(artifact.target.kind, "custom-build")
            local is_test = (artifact.profile.test == true and artifact.executable ~= nil) or
                vim.tbl_contains(artifact.target.kind, "test")

            if (cargo_args[1] == "build" and is_binary and not is_build_script) or (cargo_args[1] == "test" and is_test) then
              table.insert(executables, artifact.executable)
            end
            ::continue::
          end

          if #executables <= 0 then
            scheduled_error("No executable found, unable to start debugging")
            return
          elseif #executables > 1 then
            scheduled_error("Multiple executables found, unable to start debugging")
            return
          end

          local dap_config = {
            name = "Rust debug",
            type = "codelldb",
            request = "launch",
            program = executables[1],
            args = args.executableArgs or {},
            cwd = args.workspaceRoot,
            stopOnEntry = false,
            runInTerminal = false,
          }
          dap.run(dap_config)
        end)
      end
    }):start()
  end

  local function make_command_from_args(command, args)
    local ret = command .. " "

    for _, value in ipairs(args) do
      ret = ret .. value .. " "
    end

    return ret
  end

  local function run_command(command)
    local ok, term = pcall(require, "toggleterm.terminal")
    if not ok then
      vim.schedule(function()
        vim.notify("toggleterm not found.", vim.log.levels.ERROR)
      end)
      return
    end
    local command, args, cwd = get_command(1, command)
    term.Terminal:new({
      dir = cwd,
      cmd = make_command_from_args(command, args),
      close_on_exit = false,
      on_open = function(t)
        -- enter normal mode
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes([[<C-\><C-n>]], true, true, true),
          "",
          true
        )

        -- set close keymap
        vim.api.nvim_buf_set_keymap(
          t.bufnr,
          "n",
          "q",
          "<cmd>close<CR>",
          { noremap = true, silent = true }
        )
      end,
    }):toggle()
  end

  vim.lsp.commands["rust-analyzer.runSingle"] = function(command)
    -- Log:info(dump(command))
    run_command(command.arguments)
  end

  vim.lsp.commands["rust-analyzer.debugSingle"] = function(command)
    sanitize_command_for_debugging(command.arguments[1].args.cargoArgs)
    start_debug(command.arguments[1].args)
  end

  dap.adapters.codelldb = {
    type = 'server',
    port = "${port}",
    host = "127.0.0.1",
    executable = {
      command = vim.fn.exepath("codelldb"),
      args = { '--port', '${port}' },
    },
  }
end

return M
