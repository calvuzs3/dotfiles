return {
	"windwp/nvim-autopairs",
	event = "InsertEnter",
	config = true,
	-- use opts = {} for passing setup options
	-- this is equivalent to setup({}) function
	opts = {
		enabled = function(bufnr)
			return true
		end, -- control if auto-pairs should be enabled when attaching to a buffer

		check_ts = false,
		ts_config = {
			lua = { "string" },
			javascript = { "template_string" },
			java = false,
		},
	},
}
