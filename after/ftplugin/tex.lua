
vim.opt_local.makeprg = "latexmk -interaction=nonstopmode %"

vim.opt_local.wrap = true

vim.b.okular_opened = false

vim.api.nvim_create_user_command("View",
	function()
		local path = vim.fn.expand("%:p")
		local pdf = string.gsub(path, ".tex", ".pdf")
		local server = vim.v.servername
		local linenum = vim.fn.line(".")
		local remote_send = ""
		if not vim.b.okular_opened then
			remote_send =  "--editor-cmd 'nvim --server " .. server  .. " --remote-send <Esc>\\%lgg'"
		end
		local cmd = "silent !okular --unique " .. remote_send .. " file:" .. pdf .. "\\#src:" .. linenum .. path .. " &"
		vim.cmd(cmd)
		vim.b.okular_opened = true
	end,
	{ }
)

vim.keymap.set("n", "<C-h>", function() vim.cmd("View") end, { desc = "View PDF" } )

vim.api.nvim_create_autocmd({"VimLeavePre"}, {
	buffer = 0,
	callback = function()
		vim.cmd("!cleantex")
	end,
})

