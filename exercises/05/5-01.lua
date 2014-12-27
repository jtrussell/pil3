
function catall(...)
  local args = {...}
  local bulk = ''
  for i, v in  ipairs(args) do
    bulk = bulk .. v
  end
  return bulk
end

