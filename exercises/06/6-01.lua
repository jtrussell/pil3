
function integral(fn, x_0, x_1, delta)
  local delta = delta or 1e-4
  local sum = 0
  for x=x_0, x_1, delta do
    sum = sum + fn(x)*delta
  end
  return sum
end

print('The integral of sin from 0 --> pi is about:')
print(integral(math.sin, 0, math.pi))
