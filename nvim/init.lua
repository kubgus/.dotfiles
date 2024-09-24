require("kubgus")

vim.filetype.add({
    pattern = {
        [".*%.blade%.php"] = "blade",
    },
})
