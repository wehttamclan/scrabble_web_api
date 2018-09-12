require 'rails_helper'

describe "GET /games/1" do
  it "returns a game with scores" do
    game = create(:game, id: 1)

    get "/api/v1/games/1"

    game = JSON.parse(response.body, symbolize_names: true)

    expect(game).to have_key :id
    expect(game).to have_key :scores

    expect(game[:id]).to eq(1)
    expect(game[:scores].count).to eq(2)
    expect(game[:scores].first).to have_key(:user_id)
    expect(game[:scores].first).to have_key(:score)

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
