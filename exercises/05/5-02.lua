
-- Just using `table.unpack` on the passed array would give unpredictable
-- behavior for arrays with holes in them. We'll use `ipairs` instead to collect
-- values up until the first hole.

function print_all(arr)
  local col = {}
  for i,v in ipairs(arr) do
     col[#col+1] = v
  end
  print(table.unpack(col))
end

print_all{1, 2, 3}
print_all{1, nil, 4}
print_all{nil, nil, nil}
