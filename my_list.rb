require_relative 'my_enumerable'

class MyList
  @list = []
  include MyEnumerable

  def each(&block)
    @list.each(&block)
  end

  def initialize(*lis)
    @list = lis
  end
end

# Create our list
list = MyList.new(1, 2, 3, 4)
#=> #<MyList: @list=[1, 2, 3, 4]>

# Test #all?
list.all? { |e| e < 5 }
#=> true
list.all? { |e| e > 5 }
#=> false

# Test #any?
list.any? { |e| e == 2 }
#=> true
list.any? { |e| e == 5 }
#=> false

# Test #filter
# list.filter? { |e| e.even? } linters error
list.filter?(&:even?)
#=> [2, 4]
