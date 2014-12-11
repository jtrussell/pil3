
function uniquewords()
  local line = io.read()
  local pos = 1
  local words = {}

  return function()
    while line do
      local s, e = string.find(line, '%w+', pos)
      if s then
        pos = e + 1
        local w = string.sub(line, s, e)
        if not words[w] then
          words[w] = 1
          return w
        end
      else
        line = io.read()
        pos = 1
      end
    end
    return nil
  end
end

-- try `lua 7-03.lua < 7-03.lua`
for w in uniquewords() do
  print(w)
end

