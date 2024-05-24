
vim.opt_local.makeprg = nil

vim.opt_local.wrap = true
vim.opt_local.conceallevel = 0

vim.keymap.set({ "o", "x" }, "il",
	"<cmd>lua require('various-textobjs').mdlink('inner')<CR>",
	{ buffer = true }
)

vim.keymap.set({ "o", "x" }, "al",
	"<cmd>lua require('various-textobjs').mdlink('outer')<CR>",
	{ buffer = true }
)

vim.keymap.set({ "o", "x" }, "ie",
	"<cmd>lua require('various-textobjs').mdEmphasis('inner')<CR>",
	{ buffer = true }
)

vim.keymap.set({ "o", "x" }, "ae",
	"<cmd>lua require('various-textobjs').mdEmphasis('outer')<CR>",
	{ buffer = true }
)

vim.keymap.set({ "o", "x" }, "ic",
	"<cmd>lua require('various-textobjs').mdFencedCodeBlock('inner')<CR>",
	{ buffer = true }
)

vim.keymap.set({ "o", "x" }, "ac",
	"<cmd>lua require('various-textobjs').mdFencedCodeBlock('outer')<CR>",
	{ buffer = true }
)

local OpenMarkdown = function()
	local peek = require("peek")
	if peek.is_open() then
		peek.close()
	else
		peek.open()
	end
end

vim.keymap.set("n", "<leader>M", OpenMarkdown, { desc = "Open Markdown" })

