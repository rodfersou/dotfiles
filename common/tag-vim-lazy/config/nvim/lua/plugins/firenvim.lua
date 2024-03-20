-- Add shortcut at: brave://extensions/shortcuts
vim.g.firenvim_config = { localSettings = { [".*"] = { takeover = "never" } } }
-- vim.api.nvim_create_autocmd({ "UIEnter" }, {
--   callback = function(event)
--     if vim.g.started_by_firenvim then
--       vim.o.lines = 100
--       vim.o.columns = 300
--       -- vim.o.guifont = "Fira_Code:h24"
--     end
--   end,
-- })
return {
  "glacambre/firenvim",
  lazy = not vim.g.started_by_firenvim,
  build = function()
    vim.fn["firenvim#install"](0)
  end,
  opts = function(_, opts) end,
  { "noice.nvim", cond = not vim.g.started_by_firenvim },
  { "lualine.nvim", cond = not vim.g.started_by_firenvim }, -- not useful in the browser
}
