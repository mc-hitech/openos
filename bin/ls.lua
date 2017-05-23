-- load complex, if we can (might be low on memory)

local ok, why = pcall(function(...)
  return loadfile("/opt/core/full_ls.lua", "bt", _G)(...)
end, ...)

if not ok then
  if type(why) == "table" and why.code == 0 then
    return
  end
  io.stderr:write((why or "") .. "\nFor low memory systems, try using `list` instead\n")
  return 1
end

return why
