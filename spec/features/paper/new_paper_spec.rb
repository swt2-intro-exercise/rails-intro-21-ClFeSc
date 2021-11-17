require 'rails_helper'

# Other tests see spec/views/papers
describe "New author page", type: :feature do
  it "should show an error when no title is set" do
    visit new_paper_path
    # page.fill_in 'paper[title]', with: 'Test Paper'
    page.fill_in 'paper[venue]', with: 'Potsdam'
    page.fill_in 'paper[year]', with: 2021
    find('input[type="submit"]').click
    expect(page).to have_text 'error'
  end

  it "should show an error when no venue is set" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'Test Paper'
    # page.fill_in 'paper[venue]', with: 'Potsdam'
    page.fill_in 'paper[year]', with: 2021
    find('input[type="submit"]').click
    expect(page).to have_text 'error'
  end

  it "should show an error when no year is set" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'Test Paper'
    page.fill_in 'paper[venue]', with: 'Potsdam'
    # page.fill_in 'paper[year]', with: 2021
    find('input[type="submit"]').click
    expect(page).to have_text 'error'
  end

  it "should show an error when year is no integer" do
    visit new_paper_path
    page.fill_in 'paper[title]', with: 'Test Paper'
    page.fill_in 'paper[venue]', with: 'Potsdam'
    page.fill_in 'paper[year]', with: 'year 2021'
    find('input[type="submit"]').click
    expect(page).to have_text 'error'
  end
end
