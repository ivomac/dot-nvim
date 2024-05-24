vim.opt_local.wrap = true
vim.opt_local.makeprg = "typst compile %"

vim.api.nvim_create_user_command("View",
	function()
		local filepath = vim.api.nvim_buf_get_name(0)
		if filepath:match("%.typ$") then
			vim.cmd("silent !okular --unique " .. vim.fn.shellescape(filepath:gsub("%.typ$", ".pdf")) .. " &")
		end
	end,
	{}
)

vim.keymap.set("n", "<C-h>", function() vim.cmd("View") end, { desc = "View PDF" } )
