class ConditionalResponse
  attr_reader :condition, :phrase

  def initialize(condition, phrase)
    @condition = condition
    @phrase = phrase
  end

  def can_respond?(speech)
    condition.call(speech)
  end
end

module Speaker
  def say(phrase)
    @phrase = phrase
    self
  end

  def when(&block)
    responses << ConditionalResponse.new(block, phrase)
    self
  end

  def responses
    @responses ||= []
  end

  def anytime
    true
  end

  attr_reader :phrase

  def respond_to(speech)
    responses.find {|response| response.can_respond?(speech)}.phrase
  end

end

class Bob
  include Speaker

  def initialize
    say('Fine. Be that way!').when { |speech| speech.silence? }
    say('Woah, chill out!').when { |speech| speech.shouting? }
    say('Sure.').when { |speech| speech.question? }
    say('Whatever.').when { anytime }
  end

  def hey(speech)
    respond_to(Speech.new(speech))
  end

end

class Speech
  attr_reader :source

  def initialize(source)
    @source = source.to_s
  end

  def silence?
    source.strip.empty?
  end

  def shouting?
    source == source.upcase
  end

  def question?
    source.end_with? '?'
  end

end
