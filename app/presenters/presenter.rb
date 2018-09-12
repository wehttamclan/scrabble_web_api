class Presenter

  def initialize(search_params)
    @word = search_params[:word]
  end

  def singular?
    root_word == "#{word}"
  end

  def root_word
    service.inflections[:results]
    .first[:lexicalEntries]
    .first[:inflectionOf]
    .first[:text]
  end

  def validate
    if service.inflections
      if singular?
        "'#{root_word}' is a valid word."
      elsif !singular?
        "'#{word}' is a valid word and its root form is '#{root_word}'."
      end
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
