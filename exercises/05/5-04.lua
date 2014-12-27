
-- @todo not quite done yet... run this code you'll see it misses e.g. "ab"

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

function print_combinations(list)
  print(catall(table.unpack(list)))

  if #list < 2 then
    return
  end

  -- Print subsets containing `h`
  h = table.remove(list, 1)
  print_sets(h, list, #list)

  -- Now all subsets not containing `h`
  print_combinations(list)
end

function print_sets(h, pool, size)
  if size == 1 then
    print(h)
    return
  end

  if size < 1 then
    return
  end

  print_sets(h, pool, size-1)
end
