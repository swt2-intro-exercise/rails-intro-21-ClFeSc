require 'rails_helper'

# Other tests see spec/views/papers
describe "Index author page", type: :feature do
    it "displays all papers when no year is given" do
        @paperA = FactoryBot.create :paper
        @paperB = FactoryBot.create :paper
        @paperA.update(title: "Test Paper A", year: 2010)
        @paperB.update(title: "Test Paper B", year: 2011)
        visit papers_path

        expect(page).to have_css 'table'
        within 'table' do
            expect(page).to have_text("Title")
            expect(page).to have_text(@paperA.title)
            expect(page).to have_text @paperB.title
        end
    end

    it "displays only papers from given year" do
        @paperA = FactoryBot.create :paper
        @paperB = FactoryBot.create :paper
        @paperA.update(title: "Test Paper A", year: 2010)
        @paperB.update(title: "Test Paper B", year: 2011)
        visit papers_path(year: 2010)

        expect(page).to have_css 'table'
        within 'table' do
            expect(page).to have_text("Title")
            expect(page).to have_text(@paperA.title)
            expect(page).not_to have_text @paperB.title
        end
    end
end
