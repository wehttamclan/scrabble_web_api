require 'rails_helper'

feature 'guest user' do
  scenario 'can search' do
# As a guest user (no sign in necessary)
# When I visit "/"
    visit root_path
# And I fill in a text box with "foxes"
    fill_in :word, with: "foxes"
# And I click "Validate Word"
    click_on "Validate Word"
# Then I should see a message that says "'foxes' is a valid word and its root form is 'fox'."
    expect(current_path).to eq(validate_word_path)
    expect(page).to have_content("'foxes' is a valid word and its root form is 'fox'.")
  end
end
