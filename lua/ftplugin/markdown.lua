return {
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		opts = { app = "xdg-open", theme = "light"},
	},
}
