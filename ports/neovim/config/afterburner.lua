local vim = vim

local M = {}

M.afterburner = {
	bg = "#0d0d0d",
	surface = "#1a1a1a",
	surface_contrasted = "#272727",
	selection = "#2a1500",
	fg = "#e0e0e0",
	dim = "#444444",
	subtle = "#666666",
	comment = "#4a4a4a",
	cursor = "#cc3f00",

	orange = "#ff4f00",
	orange_mid = "#ff7a33",
	orange_pale = "#ffb380",
	orange_dark = "#cc3f00",
	warm_grey = "#a89888",

	red = "#ba160c",
	green = "#5fbf7e",
	amber = "#e09b30",
	info = "#4a8ab5",
	purple = "#a07de0",
	pink = "#d17de0",
	teal = "#4dbfa8",

	directory = "#c94000",
}

M.fogburn = {
	bg = "#F5F0EB",
	surface = "#EDE5DC",
	surface_contrasted = "#E7DDD6",
	border = "#DDD5CC",
	fg = "#2A2218",
	subtle = "#8A8078",
	dim = "#9A9088",
	comment = "#A89888",
	cursor = "#A33200",

	orange = "#C94000",
	orange_mid = "#D45A00",
	orange_pale = "#B87040",
	orange_dark = "#A33200",
	warm_gray = "#A89888",

	red = "#BA160C",
	green = "#2E7D4F",
	amber = "#9A6A10",
	info = "#2A6A9A",
	purple = "#7058C0",
	teal = "#2D8C7A",
	directory = "#c94000",
}

local function remove_italics(config, colors)
	if not config.italics and colors.style == "italic" then
		colors.style = nil
	end
	return colors
end

local function highlighter(config)
	return function(group, color)
		color = remove_italics(config, color)
		local style = color.style and "gui=" .. color.style or "gui=NONE"
		local fg = color.fg and "guifg = " .. color.fg or "guifg = NONE"
		local bg = color.bg and "guibg = " .. color.bg or "guibg = NONE"
		local sp = color.sp and "guisp = " .. color.sp or ""
		vim.cmd("highlight " .. group .. " " .. style .. " " .. fg .. " " .. bg .. " " .. sp)
	end
end

M.load_syntax = function(palette)
	return {
		ColorColumn = {
			bg = palette.surface_contrasted,
		},
		Conceal = {
			fg = palette.warm_grey,
		},
		Normal = {
			fg = palette.fg,
			bg = palette.bg,
		},
		NormalFloat = {
			bg = palette.surface,
		},
		FloatBorder = {
			fg = palette.orange_dim,
		},
		Pmenu = {
			fg = palette.fg,
			bg = palette.surface,
		},
		PmenuSel = {
			fg = palette.bg,
			bg = palette.orange,
		},
		PmenuBorder = {
			fg = palette.orange_dim,
		},
		PmenuSelBold = {
			fg = palette.bg,
			bg = palette.orange,
			style = "bold",
		},
		PmenuThumb = {
			bg = palette.orange_mid,
		},
		PmenuSbar = {
			bg = palette.surface_contrasted,
		},
		Cursor = {
			style = "reverse",
			bg = palette.bg,
			fg = palette.cursor,
		},
		CursorLine = {
			bg = palette.surface_contrasted,
		},
		NonText = { -- used for "eol", "extends" and "precedes" in listchars
			fg = palette.dim,
		},
		Visual = {
			bg = palette.selection,
		},
		VisualNOS = {
			bg = palette.green,
		},
		Search = {
			fg = palette.bg,
			bg = palette.orange_mid,
		},
		IncSearch = {
			fg = palette.bg,
			bg = palette.orange_mid,
		},
		CursorLineNr = {
			bg = palette.surface_contrasted,
			fg = palette.orange,
		},
		CursorLineSign = {
			bg = palette.surface_contrasted,
		},
		MatchParen = {
			fg = palette.pink,
		},
		Question = {
			fg = palette.yellow,
		},
		ModeMsg = {
			fg = palette.fg,
			style = "bold",
		},
		MoreMsg = {
			fg = palette.fd,
			style = "bold",
		},
		ErrorMsg = {
			fg = palette.red,
			style = "bold",
		},
		WarningMsg = {
			fg = palette.amber,
			style = "bold",
		},
		VertSplit = {
			fg = palette.cursor,
		},
		LineNr = {
			bg = palette.surface,
		},
		SignColumn = {
			bg = palette.surface,
		},
		StatusLine = {
			fg = palette.fg,
			bg = palette.surface,
		},
		StatusLineNC = {
			fg = palette.fg,
			bg = palette.surface,
		},
		Tabline = {
			bg = palette.surface,
		},
		TabLineFill = {
			bg = palette.surface,
		},
		TabLineSel = {
			bg = palette.orange_pale,
		},
		SpellBad = {
			fg = palette.red,
			style = "undercurl",
		},
		SpellCap = {
			fg = palette.teal,
			style = "undercurl",
		},
		SpellRare = {
			fg = palette.purple,
			style = "undercurl",
		},
		SpellLocal = {
			fg = palette.pink,
			style = "undercurl",
		},
		SpecialKey = {
			fg = palette.pink,
		},
		Title = {
			fg = palette.yellow,
			style = "bold",
		},
		Directory = {
			fg = palette.directory,
		},
		DiffAdd = {},
		DiffDelete = {},
		DiffChange = {},
		DiffText = {},
		diffAdded = {
			fg = palette.green,
		},
		diffRemoved = {
			fg = palette.red,
		},
		Folded = {
			fg = palette.comment,
			bg = palette.dim,
		},
		FoldColumn = {},
		Constant = {
			fg = palette.purple,
		},
		Number = {
			fg = palette.teal,
		},
		Float = {
			fg = palette.teal,
		},
		Boolean = {
			fg = palette.teal,
		},
		Character = {
			fg = palette.orange_dark,
		},
		String = {
			fg = palette.orange_mid,
		},
		Type = {
			fg = palette.orange_pale,
		},
		Structure = {
			fg = palette.warm_grey,
		},
		StorageClass = {
			fg = palette.warm_grey,
		},
		Typedef = {
			fg = palette.warm_grey,
		},
		Identifier = {
			fg = palette.fg,
		},
		Function = {
			fg = palette.amber,
			style = "italic",
		},
		Statement = {
			fg = palette.pink,
		},
		Operator = {
			fg = palette.teal,
		},
		Label = {
			fg = palette.orange_mid,
		},
		Keyword = {
			fg = palette.orange,
			style = "bold",
		},
		PreProc = {
			fg = palette.amber,
			style = "italic",
		},
		Include = {
			fg = palette.amber,
			style = "italic",
		},
		Define = {
			fg = palette.amber,
		},
		Macro = {
			fg = palette.amber,
			style = "bold",
		},
		PreCondit = {
			fg = palette.pink,
		},
		Special = {
			fg = palette.purple,
			style = "bold",
		},
		SpecialChar = {
			fg = palette.amber,
		},
		Delimiter = {
			fg = palette.subtle,
		},
		SpecialComment = {
			fg = palette.purple,
			style = "bold",
		},
		Tag = {
			fg = palette.orange,
			style = "bold",
		},
		Todo = {
			fg = palette.orange,
		},
		Comment = {
			fg = palette.comment,
			style = "italic",
		},
		Underlined = {
			style = "underline",
		},
		Ignore = {},
		Error = {
			fg = palette.red,
		},
		Terminal = {
			fg = palette.fg,
			bg = palette.bg,
		},
		EndOfBuffer = {
			fg = palette.comment,
		},
		vCursor = {
			style = "reverse",
		},
		iCursor = {
			style = "reverse",
		},
		lCursor = {
			style = "reverse",
		},
		CursorIM = {
			style = "reverse",
		},
		CursorColumn = {
			bg = palette.surface_contrasted,
		},
		Whitespace = { -- used for "nbsp", "space", "tab" and "trail" in listchars
			fg = palette.dim,
		},
		WildMenu = {
			fg = palette.fg,
			bg = palette.orange,
		},
		QuickFixLine = {
			fg = palette.purple,
			style = "bold",
		},
		Debug = {
			fg = palette.orange,
		},
		debugBreakpoint = {
			fg = palette.fg,
			bg = palette.red,
		},
		Conditional = {
			fg = palette.orange,
		},
		Repeat = {
			fg = palette.orange,
		},
		Exception = {
			fg = palette.pink,
		},
	}
end

M.load_plugin_syntax = function(palette)
	local math_group = {
		fg = palette.purple,
	}
	local strike_group = {
		fg = palette.dim,
	}
	local todo_group = {
		fg = palette.teal,
	}
	local uri_group = {
		fg = palette.teal,
		style = "underline",
	}
	return {
		["@annotation"] = {
			fg = palette.purple,
		},
		["@attribute"] = {
			fg = palette.purple,
		},
		["@boolean"] = {
			fg = palette.teal,
		},
		["@character"] = {
			fg = palette.orange_dark,
		},
		["@character.special"] = {
			fg = palette.amber,
		},
		["@comment"] = {
			fg = palette.comment,
			style = "italic",
		},
		["@conceal"] = {},
		["@keywork.conditional"] = {
			fg = palette.orange,
		},
		["@keyword.conditional.ternary"] = {
			fg = palette.amber,
		},
		["@constant"] = {
			fg = palette.purple,
		},
		["@constant.builtin"] = {
			fg = palette.orange_dark,
		},
		["@constant.macro"] = {
			fg = palette.amber,
		},
		["@constructor"] = {
			fg = palette.warm_grey,
		},
		["@debug"] = {
			fg = palette.orange,
		},
		["@define"] = {
			fg = palette.amber,
		},
		["@definition"] = {
			fg = palette.green,
		},
		["@definition.associated"] = {
			fg = palette.green,
		},
		["@definition.constant"] = {
			fg = palette.green,
		},
		["@definition.enum"] = {
			fg = palette.green,
		},
		["@definition.field"] = {
			fg = palette.green,
		},
		["@definition.function"] = {
			fg = palette.green,
		},
		["@definition.import"] = {
			fg = palette.white,
		},
		["@definition.macro"] = {
			fg = palette.green,
		},
		["@definition.method"] = {
			fg = palette.green,
		},
		["@definition.namespace"] = {
			fg = palette.fg,
		},
		["@definition.parameter"] = {
			fg = palette.rg,
		},
		["@definition.type"] = {
			fg = palette.orange_pale,
		},
		["@definition.var"] = {
			fg = palette.fg,
		},
		["@error"] = {
			fg = palette.red,
		},
		["@exception"] = {
			fg = palette.pink,
		},
		["@field"] = {
			fg = palette.fg,
		},
		["@float"] = {
			fg = palette.teak,
		},
		["@function"] = {
			fg = palette.amber,
			style = "italic",
		},
		["@function.builtin"] = {
			fg = palette.amber,
			style = "italic",
		},
		["@function.call"] = {
			fg = palette.amber,
			style = "italic",
		},
		["@function.macro"] = {
			fg = palette.amber,
			style = "bold",
		},
		["@include"] = {
			fg = palette.amber,
			style = "italic",
		},
		["@keyword"] = {
			fg = palette.orange,
			style = "bold",
		},
		["@keyword.type"] = {
			fg = palette.orange_mid,
			style = "bold",
		},
		["@keyword.modifier"] = {
			fg = palette.orange_dark,
			style = "bold",
		},
		["@keyword.function"] = {
			fg = palette.orange,
			style = "italic",
		},
		["@keyword.import"] = {
			fg = palette.amber,
			style = "italic",
		},
		["@keyword.operator"] = {
			fg = palette.orange_mid,
		},
		["@keyword.return"] = {
			fg = palette.orange_pale,
		},
		["@label"] = {
			fg = palette.orange_mid,
		},
		["@math"] = math_group,
		["@method"] = {
			fg = palette.amber,
			style = "italic",
		},
		["@method.call"] = {
			fg = palette.amber,
			style = "italic",
		},
		["@module"] = {
			fg = green,
		},
		["@namespace"] = {
			fg = palette.warm_grey,
		},
		-- ["@nospell"] = {},
		["@number"] = {
			fg = palette.teal,
		},
		["@number.float"] = {
			fg = palette.teal,
		},
		["@operator"] = {
			fg = palette.orange_mid,
		},
		["@parameter"] = {
			fg = palette.fg,
		},
		["@parameter.reference"] = {
			fg = palette.fg,
		},
		["@preproc"] = {
			fg = palette.amber,
		},
		["@property"] = {
			fg = palette.fg,
		},
		["@punctuation.bracket"] = {
			fg = palette.subtle,
		},
		["@punctuation.delimiter"] = {
			fg = palette.subtle,
		},
		["@punctuation.special"] = {
			fg = palette.pink,
		},
		["@reference"] = {
			fg = palette.fg,
		},
		["@keyword.repeat"] = {
			fg = palette.orange,
		},
		["@scope"] = {
			fg = palette.white,
		},
		-- ["@spell"] = {},
		["@storageclass"] = {
			fg = palette.info,
		},
		["@storageclass.lifetime"] = {
			fg = palette.info,
		},
		["@strike"] = strike_group,
		["@string"] = {
			fg = palette.orange_mid,
		},
		["@string.documentation"] = {
			fg = palette.subtle,
		},
		["@comment.documentation"] = {
			fg = palette.subtle,
		},
		["@string.escape"] = {
			fg = palette.amber,
		},
		["@string.regex"] = {
			fg = palette.amber,
		},
		["@string.special"] = {
			fg = palette.orange_pale,
		},
		["@symbol"] = {
			fg = palette.purple,
		},
		["@tag"] = {
			fg = palette.orange,
			style = "bold",
		},
		["@tag.attribute"] = {
			fg = palette.orange_mid,
		},
		["@tag.delimiter"] = {
			fg = palette.warm_grey,
		},
		["@diff.plus"] = {
			fg = palette.green,
		},
		["@diff.minus"] = {
			fg = palette.red,
		},
		["@diff.delta"] = {
			fg = palette.teal,
		},
		["@markup.heading"] = { fg = palette.orange, style = "bold" },
		["@markup.list"] = { fg = palette.orange_mid },
		["@markup.bold"] = { fg = palette.fg, style = "bold" },
		["@markup.italic"] = { fg = palette.fg, style = "italic" },
		["@markup.strikethrough"] = { fg = palette.dim, style = "strikethrough" },
		["@markup.link.url"] = { fg = palette.info, style = "underline" },
		["@markup.link.text"] = { fg = palette.orange_pale },
		["@markup.raw"] = { fg = palette.teal },

		["@text"] = {
			fg = palette.green,
		},
		["@text.danger"] = {
			fg = palette.red,
			style = "bold",
		},
		["@text.diff.add"] = {
			fg = palette.gree,
		},
		["@text.diff.delete"] = {
			fg = palette.diff_remove,
		},
		["@text.emphasis"] = {
			style = "bold",
		},
		["@text.environment"] = {
			fg = palette.purple,
		},
		["@text.environment.name"] = {
			fg = palette.aqua,
		},
		["@text.literal"] = {
			fg = palette.yellow,
		},
		["@text.math"] = math_group,
		["@text.note"] = {
			fg = palette.aqua,
			style = "bold",
		},
		["@text.quote"] = {
			fg = palette.grey,
		},
		["@text.reference"] = {
			fg = palette.orange,
			style = "italic",
		},
		["@text.strike"] = strike_group,
		["@text.strong"] = {
			style = "bold",
		},
		["@text.title"] = {
			fg = palette.orange,
			style = "bold",
		},
		["@text.todo"] = todo_group,
		["@text.underline"] = {
			style = "underline",
		},
		["@text.uri"] = uri_group,
		["@text.warning"] = {
			fg = palette.amber,
			style = "bold",
		},
		["@todo"] = todo_group,
		["@type"] = {
			fg = palette.orange_pale,
		},
		["@type.builtin"] = {
			fg = palette.warm_grey,
		},
		["@type.definition"] = {
			fg = palette.warm_grey,
		},
		["@type.qualifier"] = {
			fg = palette.orange_dark,
		},
		["@uri"] = uri_group,
		["@variable"] = {
			fg = palette.fg,
		},
		["@variable.builtin"] = {
			fg = palette.orange,
		},
		["@variable.parameter"] = {
			fg = palette.fg,
		},
		["@variable.member"] = {
			fg = palette.fg,
		},
		dbui_tables = {
			fg = palette.fg,
		},
		DiagnosticSignError = {
			fg = palette.red,
		},
		DiagnosticSignWarn = {
			fg = palette.amber,
		},
		DiagnosticSignInfo = {
			fg = palette.info,
		},
		DiagnosticSignHint = {
			fg = palette.teal,
		},
		DiagnosticVirtualTextError = {
			fg = palette.comment,
			style = "undercurl",
			sp = palette.red,
		},
		DiagnosticVirtualTextWarn = {
			fg = palette.comment,
			style = "undercurl",
			sp = palette.amber,
		},
		DiagnosticVirtualTextInfo = {
			fg = palette.comment,
			style = "undercurl",
			sp = palette.info,
		},
		DiagnosticVirtualTextHint = {
			fg = palette.comment,
			style = "undercurl",
			sp = palette.teal,
		},
		DiagnosticUnderlineError = {
			style = "undercurl",
			sp = palette.red,
		},
		DiagnosticUnderlineWarn = {
			style = "undercurl",
			sp = palette.amber,
		},
		DiagnosticUnderlineInfo = {
			style = "undercurl",
			sp = palette.info,
		},
		DiagnosticUnderlineHint = {
			style = "undercurl",
			sp = palette.teal,
		},
		CursorWord0 = {
			bg = palette.fg,
			fg = palette.bg,
		},
		CursorWord1 = {
			bg = palette.fg,
			fg = palette.bg,
		},
		NvimTreeFolderName = {
			fg = palette.fg,
		},
		NvimTreeRootFolder = {
			fg = palette.pink,
		},
		NvimTreeSpecialFile = {
			fg = palette.fg,
			style = "NONE",
		},

		-- Telescope
		TelescopeBorder = {
			fg = palette.base7,
		},
		TelescopeNormal = {
			fg = palette.base8,
			bg = palette.base0,
		},
		TelescopeSelection = {
			fg = palette.white,
			style = "bold",
		},
		TelescopeSelectionCaret = {
			fg = palette.green,
		},
		TelescopeMultiSelection = {
			fg = palette.pink,
		},
		TelescopeMatching = {
			fg = palette.aqua,
		},

		-- hrsh7th/nvim-cmp
		CmpDocumentation = { fg = palette.fg, bg = palette.surface },
		CmpDocumentationBorder = { fg = palette.fg, bg = palette.bg },

		CmpItemAbbr = { fg = palette.white },
		CmpItemAbbrMatch = { fg = palette.aqua },
		CmpItemAbbrMatchFuzzy = { fg = palette.aqua },

		CmpItemKindDefault = { fg = palette.white },
		CmpItemMenu = { fg = palette.base6 },

		CmpItemKindKeyword = { fg = palette.pink },
		CmpItemKindVariable = { fg = palette.pink },
		CmpItemKindConstant = { fg = palette.pink },
		CmpItemKindReference = { fg = palette.pink },
		CmpItemKindValue = { fg = palette.pink },

		CmpItemKindFunction = { fg = palette.aqua },
		CmpItemKindMethod = { fg = palette.aqua },
		CmpItemKindConstructor = { fg = palette.aqua },

		CmpItemKindClass = { fg = palette.orange },
		CmpItemKindInterface = { fg = palette.orange },
		CmpItemKindStruct = { fg = palette.orange },
		CmpItemKindEvent = { fg = palette.orange },
		CmpItemKindEnum = { fg = palette.orange },
		CmpItemKindUnit = { fg = palette.orange },

		CmpItemKindModule = { fg = palette.yellow },

		CmpItemKindProperty = { fg = palette.green },
		CmpItemKindField = { fg = palette.green },
		CmpItemKindTypeParameter = { fg = palette.green },
		CmpItemKindEnumMember = { fg = palette.green },
		CmpItemKindOperator = { fg = palette.green },

		-- ray-x/lsp_signature.nvim
		LspSignatureActiveParameter = { fg = palette.orange },
	}
end

local default_config = {
	palette = M.afterburner,
	custom_hlgroups = {},
	italics = true,
}

M.setup = function(config)
	vim.cmd("hi clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.o.background = "dark"
	vim.o.termguicolors = true
	config = config or {}
	config = vim.tbl_deep_extend("keep", config, default_config)
	local used_palette = config.palette or M.afterburner
	vim.g.colors_name = used_palette.name
	local syntax = M.load_syntax(used_palette)
	syntax = vim.tbl_deep_extend("keep", config.custom_hlgroups, syntax)
	local highlight = highlighter(config)
	for group, colors in pairs(syntax) do
		highlight(group, colors)
	end
	local plugin_syntax = M.load_plugin_syntax(used_palette)
	plugin_syntax = vim.tbl_deep_extend("keep", config.custom_hlgroups, plugin_syntax)
	for group, colors in pairs(plugin_syntax) do
		highlight(group, colors)
	end
end

return M
