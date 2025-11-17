-- devel (1.5)
-- https://github.com/makestatic/devel.nvim

local c = {
	black   = "#000000",
	gray    = "#808080",
	white   = "#ffffff",
	red     = "#ff0000",
	green   = "#33ff00",
	blue    = "#0066ff",
	magenta = "#cc00ff",
	cyan    = "#00ffff",
	brown   = "#A0522D",
}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
	vim.cmd("syntax reset")
end
vim.g.colors_name = "devel"
vim.o.termguicolors = true

local groups = {
	Normal            = { fg = c.white, bg = c.black },
	Cursor            = { fg = c.white, bg = c.black },
	CursorLine        = { bg = c.black },
	LineNr            = { fg = c.brown, bg = c.black },
	CursorLineNr      = { fg = c.brown, bg = c.black },
	SignColumn        = { bg = c.black },
	VertSplit         = { fg = c.gray, bg = c.black },
	StatusLine        = { fg = c.white, bg = c.black },
	StatusLineNC      = { fg = c.gray, bg = c.black },
	Comment           = { fg = c.blue },
	Visual            = { bg = c.gray },
	Search            = { fg = c.black, bg = c.brown },
	IncSearch         = { fg = c.black, bg = c.green },
	Pmenu             = { fg = c.white, bg = c.black },
	PmenuSel          = { fg = c.brown, bg = c.black },
	PmenuSbar         = { bg = c.black },
	PmenuThumb        = { bg = c.gray },
	EndOfBuffer       = { fg = c.black },
	MatchParen        = { bg = c.magenta, fg = c.black, bold = true },
	Keyword           = { fg = c.brown },
	Statement         = { fg = c.brown },
	Conditional       = { fg = c.brown },
	Repeat            = { fg = c.brown },
	Label             = { fg = c.brown },
	Exception         = { fg = c.brown },
	KeywordFunction   = { fg = c.brown },
	Type              = { fg = c.green },
	TypeBuiltin       = { fg = c.green },
	String            = { fg = c.red },
	Character         = { fg = c.red },
	Number            = { fg = c.red },
	Boolean           = { fg = c.red },
	Constant          = { fg = c.magenta },
	ConstantBuiltin   = { fg = c.magenta },
	Identifier        = { fg = c.white },
	IdentifierBuiltin = { fg = c.magenta },
	Function          = { fg = c.white },
	FunctionBuiltin   = { fg = c.magenta },
	Operator          = { fg = c.white },
	SpecialChar       = { fg = c.magenta },
	Special           = { fg = c.white },
	PreProc           = { fg = c.magenta },
	Include           = { fg = c.magenta },
	Define            = { fg = c.magenta },
	Macro             = { fg = c.magenta },
	Todo              = { fg = c.magenta, bold = true },
	Delimiter         = { fg = c.white },

	CompileModeMessage          = { underline = true },
	CompileModeMessageRow       = { fg = c.white },
	CompileModeMessageCol       = { fg = c.red },
	CompileModeError            = { fg = c.red },
	CompileModeWarning          = { fg = c.magenta },
	CompileModeInfo             = { fg = c.blue },
	CompileModeCommandOutput    = { fg = c.green },
	CompileModeDirectoryMessage = { fg = c.magenta },
	CompileModeOutputFile       = { fg = c.green },
	CompileModeCheckResult      = { fg = c.red, bold = true },
	CompileModeCheckTarget      = { fg = c.green },
	CompileModeErrorLocus       = { link = "Visual" },
}

-- terminal colors (fix: use vim.g)
local g = vim.g
g.terminal_color_0  = c.black
g.terminal_color_1  = c.red
g.terminal_color_2  = c.green
g.terminal_color_3  = c.blue
g.terminal_color_4  = c.blue
g.terminal_color_5  = c.magenta
g.terminal_color_6  = c.cyan
g.terminal_color_7  = c.white
g.terminal_color_8  = c.black
g.terminal_color_9  = c.red
g.terminal_color_10 = c.green
g.terminal_color_11 = c.blue
g.terminal_color_12 = c.blue
g.terminal_color_13 = c.magenta
g.terminal_color_14 = c.cyan
g.terminal_color_15 = c.white

-- apply highlight groups
for group, opts in pairs(groups) do
	vim.api.nvim_set_hl(0, group, opts)
end

-- treesitter link map
local ts = {
	["@keyword"]               = "Keyword",
	["@keyword.return"]        = "Keyword",
	["@keyword.repeat"]        = "Repeat",
	["@keyword.conditional"]   = "Conditional",
	["@keyword.import"]        = "Include",
	["@keyword.directive"]     = "PreProc",
	["@keyword.modifier"]      = "Type",
	["@type"]                  = "Type",
	["@type.builtin"]          = "TypeBuiltin",
	["@type.definition"]       = "Type",
	["@type.qualifier"]        = "Type",
	["@type.qualifier.c"]      = "Type",
	["@keyword.type"]          = "Type",

	["@constant"]              = "Constant",
	["@constant.builtin"]      = "ConstantBuiltin",
	["@constant.macro"]        = "Macro",
	["@boolean"]               = "Boolean",
	["@number"]                = "Number",
	["@float"]                 = "Number",
	["@string"]                = "String",
	["@string.escape"]         = "SpecialChar",
	["@string.special"]        = "String",
	["@character"]             = "Character",
	["@function"]              = "Function",
	["@function.call"]         = "Function",
	["@function.builtin"]      = "FunctionBuiltin",
	["@method"]                = "Function",
	["@constructor"]           = "Function",
	["@field"]                 = "Identifier",
	["@variable"]              = "Identifier",
	["@variable.builtin"]      = "IdentifierBuiltin",
	["@operator"]              = "Operator",
	["@punctuation.delimiter"] = "Delimiter",
	["@punctuation.bracket"]   = "Delimiter",
	["@punctuation.special"]   = "SpecialChar",
	["@preproc"]               = "PreProc",
	["@include"]               = "Include",
	["@define"]                = "Define",
	["@macro"]                 = "Macro",
	["@comment"]               = "Comment",
	["@comment.todo"]          = "Todo",
}

for group, link in pairs(ts) do
	if type(link) == "string" then
		vim.api.nvim_set_hl(0, group, { link = link })
	else
		vim.api.nvim_set_hl(0, group, link)
	end
end

vim.api.nvim_set_hl(0, '@lsp.type.comment', {})
