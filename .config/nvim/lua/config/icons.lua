local icons = {}

icons.ui = {
  ArrowDown = "",
  ArrowLeft = "",
  ArrowRight = "",
  ArrowUp = "",
  ArrowCircleDown = "󰳜",
  ArrowCircleLeft = "󰳞",
  ArrowCircleRight = "󰳠",
  ArrowCircleUp = "󰳢",
  Beaker = "",
  BookMark = "",
  BoxChecked = "",
  Bug = "",
  Stacks = "",
  DebugConsole = "",
  DebugStop = "",
  Calendar = "",
  Check = "",
  ChevronDown = "",
  ChevronLeft = "",
  ChevronRight = "",
  ChevronUp = "",
  ChromeMaximize = "",
  Circle = "",
  CircleFilled = "",
  CircleLarge = "",
  CircleLargeFilled = "",
  CircleSmallFilled = "",
  Close = "",
  CloseAll = "",
  CloudDownload = "",
  Code = "",
  Comment = "",
  Dashboard = "",
  DividerLeft = "",
  DividerRight = "",
  Ellipsis = "…",
  Error = "",
  File = "",
  FileSymlink = "",
  Files = "",
  FileTree = "󱏒",
  FindFile = "󰮗",
  FindText = "",
  Fire = "",
  Folder = "",
  FolderOpened = "",
  FolderSymlink = "",
  Gear = "",
  History = "",
  Info = "",
  Lightbulb = "",
  LightbulbAutofix = "",
  LineLeft = "▏",
  LineMiddle = "│",
  List = "",
  ListTree = "",
  Lock = "",
  NewFile = "",
  Note = "",
  Package = "󰏗",
  Edit = "",
  Plus = "",
  Project = "",
  Pencil = "✎",
  Search = "",
  Skull = "󰯈",
  SignIn = "",
  SignOut = "",
  Tab = "",
  Table = "",
  Target = "󰀘",
  Telescope = "",
  Text = "",
  Tree = "󰐅",
  Triangle = "契",
  TriangleShortArrowDown = "",
  TriangleShortArrowLeft = "",
  TriangleShortArrowRight = "",
  TriangleShortArrowUp = "",
  Warning = "",
  Palette = "󰏘",
  PaletteLine = "󰸌",
  Question = "",
  Heart = "󰣐",
  HeartLine = "󱢠",
  PrimitiveSquare = "",
  PrimitiveSquareLine = "",
  PrimitiveDot = "",
}

icons.diagnostics = {
  Error = icons.ui.Error,
  Warn = icons.ui.Warning,
  Info = icons.ui.Info,
  Hint = icons.ui.Lightbulb,
}

icons.misc = {
  Lazy = "󰒲",
}

icons.kinds = {
  Array = "",
  Boolean = "",
  Class = "",
  Constant = "",
  Constructor = "",
  Copilot = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "",
  Folder = icons.ui.Folder,
  Function = "",
  Interface = "",
  Key = "",
  Keyword = "",
  Method = "",
  Module = "",
  Namespace = "",
  Null = "",
  Number = "",
  Object = "",
  Operator = "",
  Package = "",
  Property = "",
  Reference = "",
  Snippet = "",
  String = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "",
  -- added or overrided
  Codeium = "",
  Color = icons.ui.Palette,
}

icons.git = {
  Added = "",
  Modified = "",
  Deleted = "",
  Ignored = "",
  Renamed = "",
  Staged = "",
  Unstaged = "",
  Untracked = icons.ui.DebugStop,
  Unmerged = "",
  Conflict = "",
  Branch = "󰘬",
  Diff = "",
  Repo = "",
}
icons.git_text = vim.tbl_extend("force", icons.git, {
  Added = "A",
  Modified = "M",
  Deleted = "D",
  Ignored = "I",
  Renamed = "R",
  Staged = "S",
  Unstaged = "U",
  Untracked = "?",
})

icons.filetype = {
  tailwind = "󱏿",
}

-- alias
icons.ui.Test = icons.ui.Beaker

--- @param category 'diagnostics'|'git'|'git_text'|'misc'|'ui'|'kinds'|'filetype'
--- @param opts? table<'space'|'lower_case'>
--- @return table<string, string>
function icons.get(category, opts)
  opts = opts or {}

  local enabled_opts = {}
  for _, opt in ipairs(opts) do
    enabled_opts[opt] = true
  end

  local icon_value = {}
  local icon_copied = vim.deepcopy(icons[category])

  for key, value in pairs(icon_copied) do
    if enabled_opts.space then
      value = value .. " "
    end

    if enabled_opts.lower_case then
      icon_value[string.lower(key)] = value
    end

    icon_value[key] = value
  end

  return icon_value
end

return icons
