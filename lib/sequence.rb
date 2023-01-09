class Sequence
  attr_accessor :sequence

  # @param array [Array<Integer>] the array of integers representing the sequence
  # @return [Array]
  def initialize(array)
    self.sequence = array
  end

  # Determine whether it is possible to obtain a strictly increasing sequence by removing no more than one element
  # from the sequence
  # @return [Boolean] whether the sequence is an almost increasing sequence
  def almost_increasing_sequence?
    removed_integer_once    = false
    last_idx                = sequence.size - 1
    current_largest_integer = sequence.first
    second_largest_integer  = nil
    idx                     = 1

    loop do
      return true if idx >= sequence.size
      current_integer = sequence[idx]

      if current_integer > current_largest_integer
        return true if idx == last_idx # no need to proceed if the current integer is the last one
        second_largest_integer  = current_largest_integer
        current_largest_integer = current_integer
        idx                     += 1
        next
      end

      # if the current integer isn't greater than the current largest integer, we will have to remove one integer
      # to try to make the sequence strictly increasing, and if we already did that once, we can't do it again
      return false if removed_integer_once
      removed_integer_once = true

      next_integer = sequence[idx + 1]
      # pop the current integer if it is already the last one, e.g. pop 3 in [1, 3, 65, 85, 3]
      if next_integer.nil?
        return true
      # pop current_integer, e.g. 10 > 7 in [1, 2, 6, 7, 4, 10], pop 4
      elsif next_integer > current_largest_integer
        current_largest_integer = next_integer
        idx                     += 2 # skip to the one after next integer
      # pop prev_integer, e.g. 4 <= 5 in [1, 2, 5, 3, 4], pop 5
      else
        # if the current integer isn't strictly larger than the second largest integer after popping the largest
        # integer, the sequence fails, e.g. 3 <= 4 in [1, 4, 5, 3, 4]
        return false if second_largest_integer && current_integer <= second_largest_integer

        current_largest_integer = current_integer
        idx                     += 1
      end
    end
  end
end