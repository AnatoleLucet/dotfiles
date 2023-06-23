-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
}

---@type HLTable
M.add = {

  ConflictMarkerOurs = {
    bg = "#2e5049",
  },
  ConflictMarkerTheirs = {
    bg = "#344f69",
  },
  ConflictMarkerCommonAncestorsHunk = {
    bg = "#754a81",
  },
}

return M
