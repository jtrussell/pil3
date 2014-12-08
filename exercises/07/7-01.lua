
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

-- Implement as a stateless iterator?

io.write('Give me a start number: ')
local min = io.read('*number')

io.write('Give me an end number: ')
local max = io.read('*number')

print('Here all the numbers in range (inclusive):')
for ix in fromto(min, max) do
  print(ix)
end
