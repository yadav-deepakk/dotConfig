return {
  filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  root_markers = { 'jsconfig.json', 'tsconfig.json', 'package.json', '.git' },
  settings = {
    javascript = {
      preferences = {
        importModuleSpecifier = 'non-relative', -- or "relative"
        includePackageJsonAutoImports = 'on',
      },
      suggest = { autoImports = true, completeFunctionCalls = true },
    },
  },
  init_options = {
    preferences = {
      includeCompletionsForModuleExports = true,
      includeCompletionsForImportStatements = true,
    },
  },
}
