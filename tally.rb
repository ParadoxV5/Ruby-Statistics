module Enumerable
  alias :old_tally :tally
  private(:old_tally)
  def tally
    if block_given?
      each {|x| yield(x) }.old_tally
    else
      old_tally
    end
  end
end