class Speech
  attr_reader :source

  def initialize(source)
    @source = source.to_s
  end

  def silence?
    source.strip.empty?
  end

  def shouting?
    source == source.upcase && source != source.downcase
  end

  def question?
    source.end_with? '?'
  end

  def classify
    if silence?
      :silence
    elsif shouting?
      :shouting
    elsif question?
      :question
    else
      :unknown
    end
  end

end

class Bob

  def self.hey(speech)
    case Speech.new(speech).classify
      when :silence then 'Fine. Be that way!'
      when :shouting then 'Whoa, chill out!'
      when :question then 'Sure.'
      else 'Whatever.'
    end
  end

end