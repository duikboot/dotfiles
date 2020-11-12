local nvim_lsp = require'nvim_lsp'


configs.cl_lsp = {
  default_config = {
    cmd = {"cl-lsp"};
    filetypes = {"lisp"};
    root_dir = function(fname)
      return vim.fn.getcwd()
    end;
    setttings = {};
  };
};
