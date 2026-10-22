-- (:h lspconfig-all) if you want support for lombok along with jdtls
vim.env.JDTLS_JVM_ARGS = "-javaagent:" .. vim.fn.stdpath("data")
    .. "/mason/packages/jdtls/lombok.jar"

return {}
