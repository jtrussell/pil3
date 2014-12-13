
-- Ended up being a bit convoluted but a good experiment with load and lexical
-- scoping.
function loadwithprefix(pref, chunkOrReader)

  local _reader

  _reader = function()
    -- After the first call we update this reader function to return
    -- `chunkOrReader` or, when `chunkOrReader` is not a string but (probably) a
    -- function we let that function take over.
    if type(chunkOrReader) == 'string' then
      _reader = function()
        _reader = function() return nil end
        return chunkOrReader
      end
    else
      _reader = chunkOrReader
    end

    -- Use the `pref` as the first chunk in our reader function
    return pref
  end

  local reader = function()
    return _reader()
  end

  return load(reader)
end

io.write('Give me a prefix: ')
local pref = io.read()

io.write('Give me a chunk to run after that prefix: ')
local chunk = io.read()

local f, msg = loadwithprefix(pref, chunk)

if f then
  print('Here is what I got:')
  print(f())
else
  print('Something went wrong... Did you mean to put a space or semicolon after your prefix?')
  print(msg)
end
