class Beer
  
  def verse(bottles_on_wall)
    "#{bottles_on_wall} bottles of beer on the wall, #{bottles_on_wall} bottles of beer.\nTake one down and pass it around, #{bottles_on_wall - 1} bottles of beer on the wall.\n"
  end
  
  def sing(first, last = first)
    first.downto(last).each_with_object('') do |bottle_number, verse|
      verse += 'oi'
    end
  end  
end