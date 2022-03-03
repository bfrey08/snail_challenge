require 'pry'

# add the first array to the snail array
# 1st  ..............

#Method 1

# Take a position of the array
# add that element into the answer array when it is that positions turn

#_________________

# add the first array to the answer array
# add the last elements of the middle arrays to the answer array
# add the last array in total to the answer array
# add the first elements of the middle arrays
# add the rest of the second array, minus the last digit





#hit each position only once //
# write a loop that follows a pattern with the caviat of not hitting a previous position


class Snail

  def initialize(matrix)
    @matrix = matrix
    @hash = @matrix.map.with_index{|val,index| [index,val]}.to_h
    @answer = []
    @counter = 0
    @counter2 = 0
    @counter3 = 0
    @matrix_length = @matrix.count - 1
  end

  def snailitize
    @matrix.count.times do |i|
      if @hash[i] != nil
        @hash[i].each {|num| @answer << num}
        @hash.delete(i)
      end
      @counter3 += 1

      (@matrix_length - @counter3).times do |x|
        if @hash[x+i+1] != nil
          @answer << @hash[x+i+1].last
          @hash[x+i+1].pop
        end
      end

      @hash[@matrix_length-i].reverse.each {|num| @answer << num} if @hash[@matrix_length-i] != nil
      @hash.delete(@matrix_length-i)
      @counter += 1

      (@matrix_length - @counter).times do |x|
        if @hash[(@matrix_length-(x+i+1))] != nil
          @answer << @hash[(@matrix_length-(x+i+1))].first
          @hash[(@matrix_length-(x+i+1))].shift
        end
      end


    end

    @counter2 += 1
    p @answer
  end



end






matrix = [[1, 2, 3, 4, 5, 6],
         [2, 3, 1, 3, 5, 7, 8],
         [3, 7, 9, 5, 2, 8],
         [3, 7, 9, 5, 3, 9],
         [3, 7, 9, 5, 2, 10]]
snail_1 = Snail.new(matrix)
snail_1.snailitize
