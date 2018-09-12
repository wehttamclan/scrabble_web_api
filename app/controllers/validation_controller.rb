class ValidationController < ApplicationController
  def index
    @presenter = Presenter.new(word_params)
  end

  private
  def word_params
    params.permit(:word)
  end
end
