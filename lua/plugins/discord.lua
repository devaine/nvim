-- Just Discord Rich Presence for Neovim, neat huh?
return {
	"vyfor/cord.nvim",
	build = ":Cord update",
	config = function()
		require("cord").setup({
			display = {
				flavor = "dark",
			},
			text = {
				default = "programming most likely",
				workspace = "",
			},
		})
	end,
}
