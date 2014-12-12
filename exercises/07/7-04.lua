
-- An iterator that steps through every non-empty substring of a given string.
function subs(s)
  
  function iter(state, ix)
    local h = state.head
    local t = state.tail + 1
    local m = state.max

    -- If tail has moved past the end advance head and reset tail
    if t > m then
      h = h + 1
      t = h
    end

    if h > m then
      return nil, state
    end

    state.head = h
    state.tail = t

    return string.sub(s, h, t), state
  end

  return iter, {s=s, head=1, tail=0, max=string.len(s)}, ''
end

io.write('Give me a string to get substrings of: ')
local str = io.read()

for sub in subs(str) do
  print(sub)
end
