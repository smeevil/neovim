require("nvchad.configs.lspconfig").defaults()

-- Simple servers with default config
local servers = { "html", "cssls" }
vim.lsp.enable(servers)

-- YAML Language Server with Kubernetes and Helm schema support
local ok, kubernetes = pcall(require, "kubernetes")
local k8s_schema = ok and kubernetes.yamlls_schema() or nil

vim.lsp.config.yamlls = {
  cmd = { "yaml-language-server", "--stdio" },
  filetypes = { "yaml", "yaml.docker-compose" },
  root_markers = { ".git" },
  settings = {
    yaml = {
      schemas = vim.tbl_extend("force", {
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
        ["https://json.schemastore.org/helmfile.json"] = "helmfile.yaml",
        ["https://json.schemastore.org/chart.json"] = "Chart.yaml",
      }, k8s_schema and { [k8s_schema] = "*.yaml" } or {}),
      -- Don't validate CRDs in these paths
      disableSchemaFor = { "**/crds/**/*.yaml", "**/custom/**/*.yaml" },
      validate = true,
      completion = true,
      hover = true,
      -- Globally enforce additionalProperties: false for strict validation
      disableAdditionalProperties = true,
      schemaStore = {
        enable = true,
        url = "https://www.schemastore.org/api/json/catalog.json",
      },
      yamlVersion = "1.2",
      format = {
        enable = true,
      },
      customTags = {
        "!reference sequence",
      },
    },
  },
}

vim.lsp.enable("yamlls")

-- Enable inlay hints globally
vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
    end
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers 
