
-- For reference...
-- C(n, m) = C(n-1, m-1) + C(n-1, m)

-- Return a table with all 
function combinations(set, size)
  local combs = {}

  -- If we don't have enought elements in `set` to build subsets of size `size`
  -- there's nothing to do
  if #set < size then
    return combs
  end

  -- There is only one set with no elements
  if size == 0 then
    table.insert(combs, {})
    return combs
  end

  -- We need to snag the first element from `set` and a copy of it without that
  -- first element
  local el = set[1]
  local set2 = {}

  for i = 2, #set do
    table.insert(set2, set[i])
  end

  -- C(n-1, m-1)
  for i, v in ipairs(combinations(set2, size - 1)) do
    table.insert(v, 1, el)
    table.insert(combs, v);
  end

  -- C(n-1, m)
  for i, v in ipairs(combinations(set2, size)) do
    table.insert(combs, v)
  end
  
  return combs
end

function all_combinations(set)
  local all = {}
  for size = #set, 1, -1 do
    for i, v in ipairs(combinations(set, size)) do
      table.insert(all, v)
    end
  end
  return all
end

-- test = {'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'}
test = {'a', 'b', 'c', 'd'}

for i, v in ipairs(all_combinations(test)) do
  if #v == 0 then
    print('*empty set*')
  else
    print(table.unpack(v))
  end
end
