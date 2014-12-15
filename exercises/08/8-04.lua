
-- Can you find an f such that the first returned value of pcall(pcall, f) is
-- false?

-- At this point in PiL3 I don't believe we know of a way to make the outer
-- pcall return a status of false... a little googling though shows that one
-- could use debug.sethook to register a function to be run anytime lua returns
-- from a function call. This lets us make a call to `error` after the inner
-- pcall finishes - there's no way to make the outer pcall unhappy by doing bad
-- things in the inner pcall (that's what pcall is for!).

function f()
  function sneak2()
    debug.sethook()
    error('too sneaky!')
  end

  function sneak1()
    debug.sethook(sneak2, 'r')
    error('sneak1 ...')
  end
  
  debug.sethook(sneak1, 'r')
end

if not pcall(pcall, f) then
  print('You broke everything.')
else
  print('Still standing...')
end
