class Presenter

  def initialize(search_params)
    @word = search_params[:word]
  end

  def singular?
    if service.inflections
      service.inflections[:results]
      .first[:lexicalEntries]
      .first[:inflectionOf]
      .first[:text] == "#{word}"
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
    if singular?
      "'#{root_word}' is a valid word."
    elsif !singular?
      "'#{word}' is a valid word and its root form is '#{root_word}'."
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
