
-- import `catall`
dofile '5-01.lua'

-- a, b, c, d
-- a, b, c
-- a, b, d
-- a, c, d
--
-- b, c, d
-- b, c
-- b, d
--
-- c, d
--
-- a
-- b
-- c
-- d

function cross(elm, arr)
  -- Return `{elm}` crossed with `arr`. `arr` should be a table of arrays
  local combos = {}
  local c
  for i=1,#arr do
    c = {elm}
    for j=1,#arr[i] do
      table.insert(c, arr[i][j])
    end
    table.insert(combos, c)
  end
  return combos
end

-- @todo actually needs to get all combinations with lenghth < #arr
function combinations_n_minus_one(arr)
  -- Return the set of all combinations from `arr` with length `#arr - 1`.
  local combos = {}
  local c
  for i=1,#arr do
    -- Add to `combos` the set without `arr[i]`
    c = {}
    for j=1,#arr do
      if i ~= j then
        table.insert(c, arr[j])
      end
    end
    table.insert(combos, c)
  end
  return combos
end

function printc(combo)
  print(catall(table.unpack(combo)))
end

function print_all_combinations_helper(_arr)
  -- Don't mess with the passed in table
  local arr = {}
  for i=1,#_arr do
    table.insert(arr, _arr[i])
  end

  -- 1. Print the "All the things" combination
  if #arr > 1 then
    printc(arr)
  end

  -- If we don't have at least two elements there's nothing left to do
  if #arr < 2 then
    return
  end

  -- 2. a. Remove the first element from `arr` and call it `elm`, call the rest
  --       `bulk`
  --    b. Cross `{elm}` with all combinations of `bulk` with length `#bulk - 1`
  --       and print those.
  local elm = table.remove(arr, 1)
  local bulk = arr

  local combos = cross(elm, combinations_n_minus_one(bulk))

  for i,v in ipairs(combos) do
     printc(v)
  end

  -- 3. Print all combinations of `bulk`
  print_all_combinations_helper(bulk)
end

function print_all_combinations(arr)
  print_all_combinations_helper(arr)

  -- 4. Print all the singletons since we will have skipped those
  for i=1,#arr do
    print(arr[i])
  end
end

local list1 = {'a', 'b', 'c', 'd'}

-- a = combinations_n_minus_one(list1)
-- for i=1,#a do
--   printc(a[i])
-- end

-- b = cross('0', a)
-- for i=1,#b do
--   printc(b[i]) 
-- end

print_all_combinations(list1)
