Enumerable.include module Enumerable::Statistics
###

def prod(init = 1, &blk)
  inject(init, :*, &blk)
end

def average
  sum / count.to_r
end

alias :mean :average
alias :arithmetic_mean :mean

def harmonic_mean
  1r / sum {|n| 1r / n}
end

def geometric_mean
  prod ** 1r / count
end

def sum2(init = 0)
  if block_given?
    sum(init) {|n| yield(n) ** 2}
  else
    sum(init) {|n| n**2}
  end
end

def variance
  sum2 / count.to_r - average ** 2
end

def stddev
  Math.sqrt(variance)
end
alias :standard_deviation :stddev

###
self end