# rubocop:disable
module Enumerable
  # my_each_Enumberable method
  def my_each
    return to_enum unless block_given?

    arr = to_a
    i = 0
    while i < arr.length
      yield(arr[i])
      i += 1
    end
    self
  end

  # my_each_with_index Enumberable method
  def my_each_with_index
    return to_enum unless block_given?

    index = 0
    my_each do |item|
      yield(item, index)
      index += 1
    end

    self
  end

  # my_select Enumberable method
  def my_select
    return to_enum unless block_given?

    array = []

    my_each { |num| array << num if yield(num) }

    array
  end

end
