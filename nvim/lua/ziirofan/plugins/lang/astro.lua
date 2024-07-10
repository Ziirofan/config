return {

  {
    require("lspconfig").astro.setup({}),
  },
  {
    vim.filetype.add({
      extension = {
        mdx = "markdown.mdx",
      },
      filename = {},
      pattern = {},
    }),
  },
}
