
function poly(tbl)
  return function(x)
    local val = 0
    for i=0,#tbl-1 do
      val = tbl[i+1] * x^i + val
    end
    return val
  end
end

local f = poly{5,1}
print('`5 + x` at x=2:')
print(f(2))

print('')

f = poly{1,3,2}
print('`1 + 3x + 2x^2` at x = 3')
print(f(3))
