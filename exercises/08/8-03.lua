
-- Build an unwrapped stringrep factory.
function stringrepFactory(n)
  local chunk = ''
  chunk = chunk .. 'local s = ...;local r = "";'

  if n > 0 then
    while n > 1 do
      if n % 2 ~= 0 then
        chunk = chunk .. 'r = r .. s;'
      end
      chunk = chunk .. 's = s .. s;'
      n = math.floor(n/2)
    end
    chunk = chunk .. 'r = r .. s;'
  end

  chunk = chunk .. 'return r'

  return load(chunk)
end

-- For reference...
function stringrep(s, n)
  local r = ''
  if n > 0 then
    while n > 1 do
      if n % 2 ~= 0 then r = r .. s end
      s = s .. s
      n = math.floor(n/2)
    end
    r = r .. s
  end
  return r
end

io.write('What string should I repeat? ')
local s = io.read()

io.write('How many times should I repeat it? ')
local n = io.read('*number')

stringrep_n = stringrepFactory(n)
local out = stringrep_n(s)

print('Here is what I got:')
print(out)
