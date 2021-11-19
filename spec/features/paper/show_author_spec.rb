require 'rails_helper'

# Other tests see spec/views/papers
describe "Show paper page", type: :feature do
  it "should exist at 'author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text(@alan.first_name)
    expect(page).to have_text(@alan.last_name)
    expect(page).to have_text(@alan.homepage)
  end

  it "should display authors" do
      @author = FactoryBot.create :author
      @paper = FactoryBot.create :paper
      visit paper_path(@paper)
      expect(page).to have_text(@author.name)
  end
  
end
