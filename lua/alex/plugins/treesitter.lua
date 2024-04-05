return {{
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function () 
      local configs = require("nvim-treesitter.configs")

    configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "angular", "bash", "c_sharp", "cmake", "cpp", "css", "csv", "diff", "dockerfile", "dot", "elixir", "gitcommit", "gitignore", "go", "gomod", "gosum", "gowork", "graphql", "hcl", "http", "java", "kotlin", "json", "llvm", "make", "markdown", "markdown_inline", "objc", "perl", "php", "python", "regex", "ruby", "rust", "scss", "sql", "ssh_config", "strace", "svelte", "swift", "toml", "tsx", "typescript", "vue", "xml", "yaml", "zig" },
    })

    require('vim.treesitter.query').set_query('rust', 'injections', [[
    (macro_invocation
  macro:
    [
      (scoped_identifier
        name: (_) @_macro_name)
      (identifier) @_macro_name
    ]
  (token_tree) @injection.content
  (#not-eq? @_macro_name "slint")
  (#set! injection.language "rust")
  (#set! injection.include-children))

(
  (macro_invocation
    macro: [
      (scoped_identifier name: (_) @_macro_identifer)
      (identifier) @_macro_identifer
    ]
    (token_tree
      [
        (string_literal)
        (raw_string_literal)
      ] @sql
    )
  )
  (#match? @_macro_identifer "^query")
  (#offset! @sql 0 1 0 -1)
  (set! "priority" 105)
)

(macro_invocation
  macro:
    [
      (scoped_identifier
        name: (_) @_macro_name)
      (identifier) @_macro_name
    ]
  (token_tree) @injection.content
  (#eq? @_macro_name "slint")
  (#offset! @injection.content 0 1 0 -1)
  (#set! injection.language "slint")
  (#set! injection.include-children))

([
  (line_comment)
  (block_comment)
] @injection.content
  (#set! injection.language "comment"))

((macro_invocation
  macro: (identifier) @injection.language
  (token_tree) @injection.content)
  (#any-of? @injection.language "html" "json"))

(call_expression
  function:
    (scoped_identifier
      path: (identifier) @_regex
      (#eq? @_regex "Regex")
      name: (identifier) @_new
      (#eq? @_new "new"))
  arguments:
    (arguments
      (raw_string_literal) @injection.content)
  (#set! injection.language "regex"))

(call_expression
  function:
    (scoped_identifier
      path:
        (scoped_identifier
          (identifier) @_regex
          (#eq? @_regex "Regex") .)
      name: (identifier) @_new
      (#eq? @_new "new"))
  arguments:
    (arguments
      (raw_string_literal) @injection.content)
  (#set! injection.language "regex"))

((block_comment) @injection.content
  (#match? @injection.content "/\\*!([a-zA-Z]+:)?re2c")
  (#set! injection.language "re2c"))
  ]])
    end
 }}
