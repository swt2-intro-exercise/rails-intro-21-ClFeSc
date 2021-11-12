require 'rails_helper'

describe "Show author page", type: :feature do
  it "should exist at 'author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @alan = FactoryBot.create :author
    visit author_path(@alan)
    expect(page).to have_text('Alan')
    expect(page).to have_text('Turing')
    expect(page).to have_text('http://wikipedia.de/Alan_Turing')
  end
  
end
