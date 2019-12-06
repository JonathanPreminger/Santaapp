module Matching
  def matching(array)
    @block = []
    puts array.inspect
    array.size.times do |index|
      binom =[]
      binom << array[index]
      if array[index + 1] == nil
        binom << array[0]
      else
        binom << array[index + 1]
      end
      @block << binom
    end
  end
end
