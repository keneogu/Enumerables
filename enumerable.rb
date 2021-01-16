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

  # my_all Enumberable method
  def my_all?(argument = nil)
    if argument
      my_each { |element| return false unless argument === element } # rubocop:disable Style/CaseEquality
    elsif block_given?
      my_each { |element| return false unless yield(element) }
    else
      my_each { |element| return false unless element }
    end
    true
  end

  # my_any Enumberable method
  def my_any?(argue = nil)
    result = false
    if block_given?
      my_each { |val| return true if yield(val) }
    elsif argue
      my_each { |val| return true if argue === val } # rubocop:disable Style/CaseEquality
    else
      my_each { |ele| return true if ele }
    end

    false
  end

  # my_none Enumberable method
  def my_none?(argu = nil)
    result = true
    if block_given?
      my_each { |val| return false if yield(val) }
    end
    if argu
      my_each { |val| return false if argu === val } # rubocop:disable Style/CaseEquality
    else
      my_each { |val| return false if val == true }
    end
    result
  end

  # my_count Enumberable method
  def my_count(para = nil)
    counter = 0
    if block_given?
      my_each { |val| counter += 1 if yield(val) }
    elsif para
      my_each { |val| counter += 1 if para == val }
    else
      my_each { counter += 1 }
    end
    counter
  end

  # my_count map method
  def my_map(proc = nil)
    return enum_for unless block_given?

    array1 = []

    if proc
      my_each { |element| array1 << proc.call(element) }
    else
      my_each { |element| array1 << yield(element) }
    end

    array1
  end

  # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def my_inject(arg = nil, sym = nil)
    if (arg && sym.nil?) && (arg.is_a?(Symbol) || arg.is_a?(String))
      sym = arg
      arg = nil
    end

    if !block_given? && sym
      to_a.my_each { |item| arg = arg ? arg.send(sym, item) : item }
    else
      to_a.my_each { |item| arg = arg ? yield(arg, item) : item }
    end

    arg
  end
  # rubocop:enable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
end

def multiply_els(arr)
  arr.inject(:*)
end
