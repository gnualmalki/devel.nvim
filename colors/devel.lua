-- Name        :  devel (1.1)
-- Description :  a dark neovim colorscheme for devels
-- Author      :  makestatic
-- License     :  MIT

local c = {
    black      = "#000000",
    gray       = "#808080",
    white      = "#ffffff",
    red        = "#ff0000",
    green      = "#33ff00",
    blue       = "#0066ff",
    magenta    = "#cc00ff",
    cyan       = "#00ffff",
    brown      = "#A0522D",
}


vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
end
vim.g.colors_name = "dnvim"
vim.o.termguicolors = true

local groups = {
    Normal         = { fg = c.white, bg = c.black },
    Cursor             = { fg = c.white, bg = c.black },
    CursorLine     = { bg = c.black },
    LineNr         = { fg = c.brown, bg = c.black },
    CursorLineNr   = { fg = c.brown, bg = c.black },
    SignColumn     = { bg = c.black },
    VertSplit      = { fg = c.gray, bg = c.black },
    StatusLine     = { fg = c.white, bg = c.black },
    StatusLineNC   = { fg = c.gray, bg = c.black },
    Comment        = { fg = c.blue },
    Keyword        = { fg = c.brown },
    Statement      = { fg = c.brown },
    Conditional    = { fg = c.brown },
    Repeat         = { fg = c.brown },
    Label          = { fg = c.brown },
    Exception      = { fg = c.brown },
    KeywordFunction= { fg = c.brown },
    Type           = { fg = c.green },
    TypeBuiltin    = { fg = c.magenta },
    String         = { fg = c.red },
    Number         = { fg = c.red },
    Boolean        = { fg = c.red },
    Constant       = { fg = c.magenta },
    ConstantBuiltin= { fg = c.magenta },
    Identifier     = { fg = c.white },
    IdentifierBuiltin= { fg = c.magenta },
    Function       = { fg = c.white },
    FunctionBuiltin= { fg = c.magenta },
    Operator       = { fg = c.white },
    SpecialChar    = { fg = c.magenta },
    Special        = { fg = c.white },
    PreProc        = { fg = c.magenta },
    Include        = { fg = c.magenta },
    Define         = { fg = c.magenta },
    Macro          = { fg = c.magenta },
    Todo           = { fg = c.magenta, bold = true },
    Delimiter          = { fg = c.white },
    DelimiterParen     = { fg = c.white },
    DelimiterBracket   = { fg = c.white },
    DelimiterBrace     = { fg = c.white },
    OperatorParen      = { fg = c.white },
    Visual             = { bg = c.gray },
    Search             = { fg = c.black, bg = c.brown },
    IncSearch          = { fg = c.black, bg = c.green },
    Pmenu              = { fg = c.white, bg = c.black },
    PmenuSel           = { fg = c.brown, bg = c.black },
    PmenuSbar          = { bg = c.black },
    PmenuThumb         = { bg = c.gray },
    EndOfBuffer        = { fg = c.black },
    MatchParen         = { bg = c.magenta, fg = c.black, bold = true },
}

for group, opts in pairs(groups) do
    vim.api.nvim_set_hl(0, group, opts)
end

-- who needs treesittah?
vim.schedule(function()
if vim.fn.exists(":TSDisable") == 2 then
    vim.cmd("TSDisable highlight")
end
end)
