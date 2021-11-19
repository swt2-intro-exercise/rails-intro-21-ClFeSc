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

  it "should have links to show" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @alan = FactoryBot.create :author
    visit authors_path

    expect(page).to have_link 'Show', href: author_path(@alan)
  end

  it "should have links to edit" do
    # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
    @alan = FactoryBot.create :author
    visit authors_path

    expect(page).to have_link 'Edit', href: edit_author_path(@alan)
  end

  it "should have links to delete" do
    @alan = FactoryBot.create :author
    visit authors_path
    
    expect(page).to have_link 'Delete', href: author_path(@alan)
  end
  
end
