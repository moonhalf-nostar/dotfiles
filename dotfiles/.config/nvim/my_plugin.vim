call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" - Automatically executes `filetype plugin indent on` and `syntax enable`.

" colorschemes
Plug 'vim-scripts/peaksea'
Plug 'dracula/vim'
Plug 'vim-scripts/mayansmoke'
Plug 'therubymug/vim-pyte'
Plug 'tomasr/molokai'


" status-line
" Plug 'itchyny/lightline.vim'

Plug 'vim-airline/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#scrollbar#enabled = 0
let g:airline#extensions#scrollbar#minwidth = 100
let g:airline#extensions#tabline#buf_label_first = 1
let g:airline#extensions#tabline#overflow_marker = '…'
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
nmap <leader>0 <Plug>AirlineSelectTab0
nmap <leader>, <Plug>AirlineSelectPrevTab
nmap <leader>. <Plug>AirlineSelectNextTab

Plug 'easymotion/vim-easymotion'
" Plug 'yianwillis/vimcdoc'
Plug 'justinmk/vim-sneak'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'psliwka/vim-smoothie'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'

Plug 'preservim/nerdtree'
let g:NERDTreeWinSize = 33
let g:NERDTreeWinPos = 'right'
nnoremap <leader>ee :NERDTreeToggle<CR>
nnoremap <leader>ef :NERDTreeFocus<CR>
nnoremap <leader>et :NERDTreeToggle<CR>
nnoremap <leader>em :NERDTreeMirror<CR>
nnoremap <leader>ec :NERDTreeClose<CR>

Plug 'jlanzarotta/bufexplorer'
" Plug 'fholgado/minibufexpl.vim'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-fugitive'
Plug 'luochen1990/rainbow'
Plug 'jiangmiao/auto-pairs'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'mhinz/vim-startify'
Plug 'rickhowe/diffchar.vim'

Plug 'mbbill/undotree'
nnoremap gn :UndotreeToggle<CR>:UndotreeFocus<CR>

" " Use release branch (recommended)
" Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Plug 'neovim/nvim-lspconfig'

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

call plug#end()
" You can revert the settings after the call like so:
"   filetype indent off   " Disable file-type-specific indentation
"   syntax off            " Disable syntax highlighting



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:lightline = {
"   \ 'colorscheme': 'darcula',
"   \ }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map e <Plug>(easymotion-prefix)
noremap ee e
map <Plug>(easymotion-prefix)o <Plug>(easymotion-e)
let g:EasyMotion_smartcase = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let g:sneak#s_next = 1
let g:sneak#use_ic_scs = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" mileszs/ack.vim """
" let g:ackprg = "rg --smart-case --vimgrep"
let g:ackprg = "ag --vimgrep"
" let g:ackprg = "grep -r --color=never --exclude-dir={.bzr,CVS,.git,.hg,.svn} -n"
nnoremap <Leader>a :Ack!<Space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""" lsp """

"lua << EOF
"require('lspconfig').clangd.setup({})
"EOF



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" nvim-cmp """

lua <<EOF

  -- lsp-zero.nvim

  -- NOTE: to make any of this work you need a language server.
  -- If you don't know what that is, watch this 5 min video:
  -- https://www.youtube.com/watch?v=LaS32vctfOY

  -- Reserve a space in the gutter
  vim.opt.signcolumn = 'yes'

  -- Add cmp_nvim_lsp capabilities settings to lspconfig
  -- This should be executed before you configure any language server
  local lspconfig_defaults = require('lspconfig').util.default_config
  lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    'force',
    lspconfig_defaults.capabilities,
    require('cmp_nvim_lsp').default_capabilities()
  )

  -- This is where you enable features that only work
  -- if there is a language server active in the file
  vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
      local opts = {buffer = event.buf}

      vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
      vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
      vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
      vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
      vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
      vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
      vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
      vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
      vim.keymap.set({'n', 'x'}, '<leader>fm', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
      vim.keymap.set('n', '<leader>fa', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
      vim.keymap.set('n', '<leader>fs', '<cmd>lua vim.lsp.buf.document_symbol()<cr>', opts)
    end,
  })


  -- Set up nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
      end,
    },
    window = {
      -- completion = cmp.config.window.bordered(),
      -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
  -- Set configuration for specific filetype.
  --[[ cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'git' },
    }, {
      { name = 'buffer' },
    })
 })
 require("cmp_git").setup() ]]--

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  -- -- Set up lspconfig.
  -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  -- require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --   capabilities = capabilities
  -- }
  -- require('lspconfig').clangd.setup({})
  -- require'lspconfig'.bashls.setup{}
  -- -- require'lspconfig'.pylyzer.setup{
  -- --   cmd = {"uvx", "pylyzer", "--server" }
  -- -- }
  -- -- require'lspconfig'.jedi_language_server.setup{}
  -- require'lspconfig'.pylsp.setup{
  -- settings = {
  --       pylsp = {
  --         plugins = {
  --             ruff = {
  --                 enabled = true,
  --             }
  --         }
  --       }
  --     }
  -- }
EOF

