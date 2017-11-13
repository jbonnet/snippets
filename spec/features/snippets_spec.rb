require 'spec_helper'

RSpec.feature "Snippets", type: :feature do
  include Rack::Test::Methods
  def app() SnippetApp end

  scenario "user creates a new snippet" do
    snippet = FactoryBot.create(:snippet)
    
    visit '/'
    
    fill_in "Title", with: snippet.title
    fill_in "Body", with: snippet.body
    click_button "Add snippet"
    
    expect(page).to have_content "Saved with title #{snippet.title}, body #{snippet.body}"
  end
end
