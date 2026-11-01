-- ============================================
-- LEADER
-- ============================================
-- Must happen before plugins are loaded
vim.g.mapleader = ' '

-- ============================================
-- GLOBAL OPTIONS
-- ============================================
vim.o.updatetime = 300      -- Faster CursorHold for diagnostics
vim.o.number = true         -- Show absolute line numbers
vim.o.relativenumber = false
vim.o.cursorline = true     -- Highlight cursor line
vim.o.scrolloff = 10        -- Keep 10 lines above/below cursor
vim.o.list = true           -- Show <tab> and trailing spaces
vim.o.confirm = true        -- Save before quit if unsaved changes
vim.o.ignorecase = true     -- Case-insensitive search
vim.o.smartcase = true      -- Case-sensitive if uppercase in pattern
vim.o.clipboard = 'unnamedplus'  -- Sync with OS clipboard
vim.o.expandtab = true      -- Tab inserts spaces

-- Per-language tab size
vim.api.nvim_create_autocmd('FileType', {
  callback = function(ev)
    local lang = vim.bo[ev.buf].filetype
    local tw = 4  -- default
    if lang == 'javascript' or lang == 'typescript' or lang == 'json'
       or lang == 'nix' or lang == 'bash' or lang == 'lua' then
      tw = 2
    elseif lang == 'rust' or lang == 'java' or lang == 'python' or lang == 'go' then
      tw = 4
    elseif lang == 'css' or lang == 'scss' or lang == 'html' or lang == 'markdown' then
      tw = 2
    end
    vim.bo[ev.buf].tabstop = tw
    vim.bo[ev.buf].shiftwidth = tw
    vim.bo[ev.buf].softtabstop = tw
  end,
})

-- Window navigation (Alt+hjkl)
vim.keymap.set({ 'n', 't', 'i' }, '<A-h>', '<C-w>h')
vim.keymap.set({ 'n', 't', 'i' }, '<A-j>', '<C-w>j')
vim.keymap.set({ 'n', 't', 'i' }, '<A-k>', '<C-w>k')
vim.keymap.set({ 'n', 't', 'i' }, '<A-l>', '<C-w>l')

-- Exit terminal mode with Escape
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>')

-- ============================================
-- PLUGINS
-- ============================================
vim.cmd('packadd! nohlsearch')  -- Disable search highlight after updatetime

vim.pack.add({
  -- LSP quickstart
  'https://github.com/neovim/nvim-lspconfig',
  -- Fuzzy picker
  'https://github.com/ibhagwan/fzf-lua',
  -- Autocompletion
  'https://github.com/nvim-mini/mini.completion',
  -- Enhanced quickfix/loclist
  'https://github.com/stevearc/quicker.nvim',
  -- Git integration
  'https://github.com/lewis6991/gitsigns.nvim',
  -- Base16 colorscheme support
  'https://github.com/RRethy/base16-nvim',
  -- Auto-close pairs
  'https://github.com/windwp/nvim-autopairs',
})
-- Only run pack update if plugins aren't already installed
if not vim.loop.fs_stat(vim.fn.stdpath('data') .. '/site/pack/core/opt/nvim-lspconfig') then
  vim.pack.update()
end

-- Plugin setups
require('fzf-lua').setup({ fzf_colors = true })
require('mini.completion').setup {}
require('quicker').setup {}
require('gitsigns').setup {}
require('nvim-autopairs').setup({ map_cr = true })

-- ============================================
-- AUTOCOMMANDS
-- ============================================

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking text',
  callback = function() vim.hl.on_yank() end,
})

-- User command: :GitBlameLine
vim.api.nvim_create_user_command('GitBlameLine', function()
  local line = vim.fn.line('.')
  local file = vim.api.nvim_buf_get_name(0)
  print(vim.system({ 'git', 'blame', '-L', line .. ',+1', file }):wait().stdout)
end, { desc = 'Print git blame for current line' })

-- ============================================
-- LSP COMPLETION & KEYMAPS
-- ============================================
vim.o.completeopt = 'menuone,noselect,popup'

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if not client then return end

    -- Enable autotrigger completion
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, {
        autotrigger = true,
        convert = function(item)
          return { abbr = item.label, kind = item.kind } or {}
        end,
      })
    end

    -- Completion keymaps
    vim.keymap.set('i', '<Tab>', function()
      return vim.fn.pumvisible() == 1 and '<C-n>' or '<Tab>'
    end, { expr = true, buffer = ev.buf, silent = true })
    vim.keymap.set('i', '<C-Space>', '<C-x><C-o>', { buffer = ev.buf, silent = true })
    vim.keymap.set('i', '<Enter>', function()
      return vim.fn.pumvisible() == 1 and '<C-y>' or '<CR>'
    end, { expr = true, buffer = ev.buf, silent = true })
    vim.keymap.set('i', '<S-Tab>', '<C-p>', { buffer = ev.buf, silent = true })
    vim.keymap.set('i', '<C-e>', '<C-e>', { buffer = ev.buf, silent = true })

    -- Notify LSP + syntax status
    local all_clients = vim.lsp.get_clients({ bufnr = ev.buf })
    local lsp_names = vim.tbl_map(function(c) return c.name end, all_clients)
    local syn = vim.bo[ev.buf].syntax
    local status = 'LSP: ' .. (lsp_names[1] or 'none') .. ' | Syntax: ' .. (syn or 'none')
    vim.notify(status, vim.log.levels.INFO)
  end,
})

-- ============================================
-- DIAGNOSTICS
-- ============================================
vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
  callback = function()
    vim.diagnostic.open_float({ border = 'rounded' })
  end,
})

-- ============================================
-- TYPST / TINYMIST
-- ============================================
vim.lsp.config('tinymist', {
  cmd = { 'tinymist' },
  filetypes = { 'typst' },
  root_markers = { 'TypstProject.toml', '.git' },
  single_file_support = true,
  settings = {},
})
vim.lsp.enable('tinymist')

-- ============================================
-- MARKDOWN / MARKSMAN
-- ============================================
vim.lsp.config('marksman', {
  cmd = { 'marksman', 'server' },
  filetypes = { 'markdown', 'markdown.mdx' },
  root_markers = { '.git' },
  single_file_support = true,
})
vim.lsp.enable('marksman')

-- ============================================
-- JAVA / JDTLS
-- ============================================
vim.lsp.config('jdtls', {
  cmd = { 'jdtls', '-data', vim.fn.stdpath('data') .. '/jdtls-data' },
  root_markers = {
    'settings.gradle', 'settings.gradle.kts',
    'build.gradle', 'build.gradle.kts',
    'pom.xml', '.git'
  },
  filetypes = { 'java' },
  single_file_support = true,
})
vim.lsp.enable('jdtls')

-- ============================================
-- NIX / NIXD
-- ============================================
vim.lsp.config('nixd', {
  cmd = { 'nixd' },
  filetypes = { 'nix' },
  single_file_support = true,
  settings = {
    nixd = {
      formatting = {
        command = { 'alejandra', '--quiet' },
      },
      server = {
        statix = {
          command = { 'statix', 'check', '--format', 'json' },
        },
      },
    },
  },
})
vim.lsp.enable('nixd')

-- Run current Java file: <Leader>rr
local function java_run()
  local buf = vim.api.nvim_get_current_buf()
  local path = vim.api.nvim_buf_get_name(buf)
  if path == '' or vim.fn.filereadable(path) == 0 or vim.fn.expand('%:e') ~= 'java' then
    vim.notify('No Java file to run', vim.log.levels.WARN)
    return
  end
  local file = vim.fn.fnamemodify(path, ':t')
  local class_name = vim.fn.fnamemodify(path, ':t:r')
  -- Detect package
  local pkg = ''
  local f = io.open(path, 'r')
  if f then
    for line in f:lines() do
      local p = line:match('^package%s+([%w%.]+)')
      if p then pkg = p end
      break
    end
    f:close()
  end
  -- Compute classpath root: strip package segments from the file's directory
  local cp_root = vim.fn.fnamemodify(path, ':h')
  if pkg ~= '' then
    for _ in string.gmatch(pkg, '[^.]+') do
      cp_root = vim.fn.fnamemodify(cp_root, ':h')
    end
  end
  local full_class = pkg ~= '' and (pkg .. '.' .. class_name) or class_name
  -- Save first
  vim.cmd.write()
  -- Compile
  local compile_cmd = 'cd ' .. vim.fn.shellescape(vim.fn.fnamemodify(path, ':h')) .. ' && javac ' .. vim.fn.shellescape(file)
  local compile_result = vim.fn.system(compile_cmd)
  if compile_result ~= '' then
    vim.notify('Compilation failed:\n' .. compile_result, vim.log.levels.ERROR)
    return
  end
  vim.cmd('split | terminal cd ' .. vim.fn.shellescape(cp_root) .. ' && java ' .. full_class)
  vim.notify('Running ' .. full_class, vim.log.levels.INFO)
end
vim.keymap.set('n', '<leader>rr', java_run, { desc = 'Run current Java file' })
vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format() end, { desc = 'Format buffer' })

-- Markdown preview (converts to HTML, serves via HTTP, hot-reloads on save)
local preview_html = vim.fn.stdpath('data') .. '/cache/index.html'
local preview_server = nil

local function free_port()
  local s = vim.loop.new_tcp()
  s:bind('127.0.0.1', 0)
  local port = s:getsockname().port
  s:close()
  return port
end

local function md_preview()
  local path = vim.api.nvim_buf_get_name(0)
  if path == '' or vim.fn.expand('%:e') ~= 'md' then
    vim.notify('No markdown file to preview', vim.log.levels.WARN)
    return
  end
  -- Kill existing server
  if preview_server then
    preview_server:kill()
    preview_server = nil
  end
  -- Generate HTML
  local html = vim.fn.system('pandoc -f markdown -t html --standalone ' .. vim.fn.shellescape(path))
  if vim.v.shell_error ~= 0 then
    vim.notify('pandoc failed — is it installed?', vim.log.levels.ERROR)
    return
  end
  -- Write HTML (with live-reload meta tag)
  local f = io.open(preview_html, 'w')
  if f then
    f:write(html:gsub('</head>', '<meta http-equiv="refresh" content="2">\n</head>'))
    f:close()
  end
  -- Start HTTP server on a free port
  local port = free_port()
  local ok, server = pcall(vim.system, {
    'python3', '-m', 'http.server', tostring(port), '--directory', vim.fn.stdpath('data') .. '/cache'
  }, { detach = true })
  if not ok or not server then
    vim.notify('Failed to start preview server', vim.log.levels.ERROR)
    return
  end
  preview_server = server
  vim.fn.system('xdg-open http://localhost:' .. port)
  vim.notify('Preview opened — save to hot-reload, <Leader>ms to stop', vim.log.levels.INFO)
end

-- Stop the preview server
local function md_preview_stop()
  if preview_server then
    preview_server:kill()
    preview_server = nil
    vim.notify('Preview stopped', vim.log.levels.INFO)
  else
    vim.notify('No preview running', vim.log.levels.INFO)
  end
end
vim.keymap.set('n', '<leader>ms', md_preview_stop, { desc = 'Stop Markdown Preview' })

-- Re-render HTML on save for live preview
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = '*.md',
  callback = function(ev)
    if not preview_server then return end
    local path = vim.api.nvim_buf_get_name(ev.buf)
    if path == '' then return end
    local html = vim.fn.system('pandoc -f markdown -t html --standalone ' .. vim.fn.shellescape(path))
    if vim.v.shell_error ~= 0 then return end
    local f = io.open(preview_html, 'w')
    if f then
      f:write(html:gsub('</head>', '<meta http-equiv="refresh" content="2">\n</head>'))
      f:close()
    end
  end,
})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  callback = function()
    vim.keymap.set('n', '<leader>mp', md_preview, { buffer = true, silent = true, noremap = true, desc = 'Markdown Preview' })
  end,
})

-- ============================================
-- LOCAL CONFIG (matugen)
-- ============================================
local ok, matugen = pcall(require, 'matugen')
if ok then matugen.setup() end
