class Presenter

  def initialize(word)
    @word = word
  end

  def valid?
    service.inflections
  end

  private
  attr_reader :word

  def service
    OxfordService.new(word)
  end
end
