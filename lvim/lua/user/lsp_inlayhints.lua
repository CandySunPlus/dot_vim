local M = {}

M.config = function()
  vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
  vim.api.nvim_create_autocmd("LspAttach", {
    group = "LspAttach_inlayhints",
    callback = function(args)
      local client = vim.lsp.get_client_by_id(args.data.client_id)
      if not client then
        return
      end
      if client.server_capabilities.inlayHintProvider then
        vim.lsp.inlay_hint.enable(args.buf, true)
      end
    end,
  })
end

return M
