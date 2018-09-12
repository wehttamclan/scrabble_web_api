class Presenter

  def initialize(search_params)
    @word = search_params[:word]
  end

  def plural?
    if service.inflections
      service.inflections[:results]
      .first[:lexicalEntries]
      .first[:grammaticalFeatures]
      .first[:text] == "Plural"
    else
      nil
    end
  end

  def root_word
    if service.inflections
      service.inflections[:results]
      .first[:lexicalEntries]
      .first[:inflectionOf]
      .first[:text]
    else
      nil
    end
  end

  def validate
    if plural?
      "'#{word}' is a valid word and its root form is '#{root_word}'."
    elsif root_word && (word == root_word)
      "'#{root_word}' is a valid word."
    else
      "'#{word}' is not a valid word."
    end
  end

  private
  attr_reader :word

  def service
    OxfordService.new(word)
  end
end
