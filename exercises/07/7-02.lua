
-- Stateless fromto with step parameter
function fromto(n, m, s)
  function iter(state, ix)
    ix = ix + state.step
    if ix > state.max then
      return nil
    else
      return ix, state
    end
  end

  return iter, {max=m, step=s}, n - s
end

io.write('Give me a start number: ')
local min = io.read('*number')

io.write('Give me an end number: ')
local max = io.read('*number')

io.write('Give me a step: ')
local step = io.read('*number')

for ix in fromto(min, max, step) do
  print(ix)
end
