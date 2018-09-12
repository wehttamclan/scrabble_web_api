class ValidationController < ApplicationController
  def index
    @presenter = Presenter.new(search_params)
  end

  private
  def search_params
    params.permit(:word)
  end
end
