
function skip1(_, ...)
  return ...
end

print(skip1(1,2,3,4,5))
print(skip1('foo', 'bar', 'blargus'))
print(skip1('foo', nil, 'blargus'))
