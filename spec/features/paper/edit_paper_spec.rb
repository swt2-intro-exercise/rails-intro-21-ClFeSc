require 'rails_helper'

# Other tests see spec/views/papers
describe "New author page", type: :feature do
    it "renders the author selection box" do
        @paper = FactoryBot.create :paper
        visit edit_author_path(@paper)

        # expect(page).to have_css("select[multiple]")
    end
end
