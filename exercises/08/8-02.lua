
function multiload(...)
  local args = table.pack(...)
  local ix = 1

  function reader()
    if not args[ix] then
      return nil
    elseif type(args[ix]) == 'string' then
      ix = ix + 1
      return args[ix-1]
    else
      local val = args[ix]()
      if val then
        return val
      end
      ix = ix + 1
      return reader()
    end
  end

  return load(reader)
end

print('Enter lines to run. Enter an empty line to stop.')

local lines = {}
local cont = true

while cont do
  local l = io.read()
  if string.len(l) == 0 then
    cont = false
  else
    lines[#lines+1] = l
  end
end

local f, msg = multiload(table.unpack(lines))

if f then
  print('Here is what I got:')
  print(f())
else
  print(msg)
end

