require 'rails_helper'

describe "Index author page", type: :feature do
  it "should exist at 'author_path' and render withour error" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    visit authors_path
  end

  it "should render table" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @alan = FactoryBot.create :author
    visit authors_path

    expect(page).to have_css 'table'
    within 'table' do
        expect(page).to have_text("Name")
        expect(page).to have_text("Homepage")
        expect(page).to have_text(@alan.name)
        expect(page).to have_text @alan.homepage
    end
  end

  it "should have link to create" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @alan = FactoryBot.create :author
    visit authors_path

    expect(page).to have_link 'New', href: new_author_path
  end
  
end
