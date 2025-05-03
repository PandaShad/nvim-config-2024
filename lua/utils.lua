local M = {}

function M.dedup(list)
  local seen = {}
  local out  = {}
  for _, v in ipairs(list) do
    if not seen[v] then
      seen[v] = true
      table.insert(out, v)
    end
  end
  return out
end

function M.get_plugin_opts(name)
  local plugin = require("lazy.core.config").plugins[name]
  return (plugin and plugin.opts) or {}
end

function M.is_loaded(name)
  local Config = require("lazy.core.config")
  return Config.plugins[name] and Config.plugins[name]._.loaded
end

function M.safe_keymap_set(mode, lhs, rhs, opts)
  local modes = type(mode) == "string" and { mode } or mode

  local ok = {}
  for _, m in ipairs(modes) do
    local existing = vim.keymap.get(m, lhs)
    if #existing == 0 then
      table.insert(ok, m)
    end
  end

  if #ok == 0 then
    return
  end

  opts = vim.tbl_extend("force", { silent = true }, opts or {})
  if opts.remap and not vim.g.vscode then
    opts.remap = nil
  end

  vim.keymap.set(ok, lhs, rhs, opts)
end

return M