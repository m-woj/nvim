require("config.options")

if vim.fn.filereadable(vim.fn.stdpath("config") .. "/lua/config/custom.lua") == 1 then
    require("config.custom")
end

require("config.lazy")
require("config.mappings")
