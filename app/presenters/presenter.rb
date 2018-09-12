class Presenter

  def initialize(search_params)
    @word = search_params[:word]
  end

  def plural?
    service.inflections[:results]
    .first[:lexicalEntries]
    .first[:grammaticalFeatures]
    .first[:text] == "Plural"
  end

  def validate

  end

  private
  attr_reader :word

  def service
    OxfordService.new(word)
  end
end
