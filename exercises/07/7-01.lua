
-- As a closure with state
function fromto(n, m)
  local ix = n-1
  return function()
    ix = ix + 1
    if ix > m then
      return nil 
    end
    return ix
  end
end

-- As a stateless iterator
function fromto_stateless(n, m)
  local function iter(m, ix)
    ix = ix + 1
    if ix > m then
      return nil
    end
    return ix, m
  end
  return iter, m, n - 1
end

io.write('Give me a start number: ')
local min = io.read('*number')

io.write('Give me an end number: ')
local max = io.read('*number')

io.write('Use stateless iterator version (1/0)? ')
local useStatelss = io.read('*number') == 1

print('Here all the numbers in range (inclusive):')
if(useStatelss) then
  for ix in fromto_stateless(min, max) do
    print(ix)
  end
else
  for ix in fromto(min, max) do
    print(ix)
  end
end
