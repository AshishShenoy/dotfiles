return {
	settings = {
		json = {
			schemas = require('schemastore').json.schemas {},
			validate = { enable = true },
		},
	},
	init_options = {
		-- use prettier for formatting json instead
		provideFormatter = false,
	},
}
