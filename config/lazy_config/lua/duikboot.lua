local modules = {
	"plugins.startify",
	"plugins.treesitter",
        "plugins.treesitter_context",
	"plugins.telescope",
	"plugins.cmp",
	"plugins.lsp",
	"plugins.gitsigns",
	"plugins.harpoon",
	"plugins.null_ls",
	"plugins.vlime",
	"plugins.neoterm",
	"plugins.trouble",
	"plugins.hlslens",

	"duikboot.keymaps",
	"duikboot.utils",
	"duikboot.autocmds",
}

for _, name in ipairs(modules) do
	package.loaded[name] = nil
	require(name)
end

pcall(require, "plugins.lualine")
