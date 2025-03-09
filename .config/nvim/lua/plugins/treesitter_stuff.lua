return {
  { "nvim-treesitter/playground" },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ignore_install = { "haskell" },
      vim.treesitter.language.register("markdown", "vimwiki"),
    },

    -- Custom parser for testing changes
    -- opts = function()
    --   local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    --   parser_config.my_puppet = {
    --     install_info = {
    --       url = "~/code/pr3c0g/tree-sitter-puppet", -- local path or git repo
    --       files = { "src/parser.c" }, -- note that some parsers also require src/scanner.c or src/scanner.cc
    --       -- optional entries:
    --       branch = "master", -- default branch in case of git repo if different from master
    --       generate_requires_npm = false, -- if stand-alone parser without npm dependencies
    --       requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    --     },
    --     filetype = "puppet", -- if filetype does not match the parser name
    --   }

    --   -- If you wish to set a specific parser for a filetype, you should use vim.treesitter.language.register():

    --   -- vim.treesitter.language.register("puppet", "my_puppet") -- the someft filetype will use the python parser and queries.
    -- end,
  },
}
