module BookKeeping
  VERSION = 3
end

class Hamming
  def self.compute(reference_strand, other_strand)
    if reference_strand.length != other_strand.length
      raise ArgumentError
    end
    common_length([reference_strand, other_strand]).times.count { |index| reference_strand[index] != other_strand[index] }
  end

  def self.common_length(strands)
    strands.map(&:length).min
  end
end