Enumerable.include module Enumerable::Statistics
###

def prod(init = 1, &blk)
  inject(init, :*, &blk)
end

def average
  Float(sum) / count
end
def average_r
  Rational(sum, count)
end

alias :mean :average
alias :arithmetic_mean :mean
alias :mean_r :average_r
alias :arithmetic_mean_r :mean_r

def harmonic_mean
  1 / sum {|n| 1.0 / n}
end
def harmonic_mean_r
  Rational(1, sum {|n| Rational(1, n)})
end

def geometric_mean
  prod ** Rational(1, count)
end

def sum2(init = 0)
  if block_given?
    sum(init) {|n| yield(n) ** 2}
  else
    sum(init) {|n| n**2}
  end
end

def variance
  Float(sum2) / count - average ** 2
end
def variance_r
  Rational(sum2, count) - average_r ** 2
end

def stddev
  Math.sqrt(variance)
end
alias :standard_deviation :stddev

###
self end