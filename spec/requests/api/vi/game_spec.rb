require 'rails_helper'

describe "GET /games/1" do
  it "returns a game with scores" do
    game = create(:game)

    get "/api/v1/games/1"


# When I send a GET request to “/api/v1/games/1” I receive a JSON response as follows:
#
# ```{
#   "game_id":1,
#   "scores": [
#     {
#       "user_id":1,
#       "score":15
#     },
#     {
#       "user_id":2,
#       "score":16
#     }
#   ]
# }```
  end

end
