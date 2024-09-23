return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
    require("neo-tree").setup({
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({
              action = "close"
            })
          end
        },
      }
    })
		vim.keymap.set("n", "<F12>", ":Neotree toggle right<CR>", {})
		vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})
    --vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    --  pattern = {"*"},
    --  callback = function()
    --    if vim.fn.argc() == 0 then
    --      require("neo-tree.command").execute({
    --        toggle = true,
    --        position = "right",
    --      })
    --    end
    --  end
    --})
	end
}
