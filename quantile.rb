Array.include module Array::Quantile
###

def index_of_rank(rank)
  rank = (rank * length).round - 1
  rank < 0 ? 0 : rank
end

def unsorted_quantile(rank)
  self[index_of_rank(rank)]
end
def quantile(rank)
  sort.unsorted_quantile(rank)
end

def unsorted_median
  unsorted_quantile(0.5r)
end
def median
  quantile(0.5r)
end

def unsorted_percentile(rank)
  unsorted_percentile(rank/100r)
end
def percentile(rank)
  percentile(rank/100r)
end

def unsorted_quartile(rank)
  unsorted_quantile(rank/4r)
end
def quartile(rank)
  quantile(rank/4r)
end

def interquartile_range
  a = sort
  a.unsorted_quantile(0.25r)..a.unsorted_quantile(0.75r)
end
def interquartile_difference
  a = sort
  a.unsorted_quantile(0.75r) - a.unsorted_quantile(0.25r)
end

# Tukey's fences
def inlier_range(multiplier = 1.5r)
  a = sort
  q1 = a.unsorted_quantile(0.25r)
  q3 = a.unsorted_quantile(0.75r)
  qr = (q3 - q1) * multiplier
  (q1 - qr)..(q3 + qr)
end
def outliers(...)
  r = inlier_range(...)
  reject {|x| r === x}
end

def reject_outliers(...)
  r = inlier_range(...)
  filter {|x| r === x}
end
def reject_outliers!(...)
  r = inlier_range(...)
  filter! {|x| r === x}
end
alias :delete_outliers :reject_outliers!

###
self end