class Hash
###

def untally(&blk)
  a = []
  if blk
    each {|x, n| a << Array.new(n, &blk)}
  else
    each {|x, n| a << Array.new(n, x)}
  end
end

def flat_untally(&blk)
  a = []
  if blk
    each {|x, n| a.push(*Array.new(n, &blk))}
  else
    each {|x, n| a.push(*Array.new(n, x))}
  end
end

###
end