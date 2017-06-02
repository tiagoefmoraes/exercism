module BookKeeping
  VERSION = 1
end

class Grains
  def self.square(position)
    if position < 1 || position > 64
      raise ArgumentError.new
    end
    position == 1 ? 1 : square(position - 1) * 2
  end
  
  def self.total
    grains_per_square = SQUARES.map { |square| self.square(square) }
    grains_per_square.inject(&:+)
  end
  
  private
  
  SQUARES = 1..64
end