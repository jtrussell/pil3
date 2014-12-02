
local ix = 0

print('How many iterations should I try run max (at least one)?')
local max = io.read('*n')

function foo()
  ix = ix + 1
  print('Called ' .. ix .. ' times')
  return ix < max and ';' or nil
end

load(foo)()
