return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_crate = true,
			auto_restore = false,
			suppressed_dirs = { "~/", "~/Scaricati", "~/Scrivania" },
			show_auto_restore_notif = true,
		})
	end,
}
