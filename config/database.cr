require "granite/adapter/sqlite"

Granite::Adapters << Granite::Adapter::Sqlite.new({name: "sqlite", url: Amber.settings.database_url})
Granite.settings.logger = Amber.settings.logger.dup
Granite.settings.logger.not_nil!.progname = "Granite"

