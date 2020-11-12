local nvim_lsp = require'nvim_lsp'
local configs = require'nvim_lsp/configs'

configs.cl_lsp = {
  default_config = {
    cmd = {'cl-lsp'};
    filetypes = {'lisp'};
    root_dir = function(fname)
      return nvim_lsp.util.find_git_ancestor(fname) or vim.loop.os_homedir()
    end;
    settings = {};
  };
}
-- nvim_lsp.cl_lsp.setup{}
