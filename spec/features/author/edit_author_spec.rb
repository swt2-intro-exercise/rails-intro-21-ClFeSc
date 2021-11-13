require 'rails_helper'

describe "Edit author page", type: :feature do
    it "should exist at 'edit_author_path' and render withour error" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)
    end

    it "should update the fields" do
        # https://guides.rubyonrails.org/routing.html#path-and-url-helpers
        @alan = FactoryBot.create :author
        visit edit_author_path(@alan)
        expect(@alan.name).not_to eq('Nikola Tesla')
        expect(@alan.homepage).not_to eq('http://wikipedia.org/Nikola_Tesla')

        page.fill_in 'author[first_name]', with: 'Nikola'
        page.fill_in 'author[last_name]', with: 'Tesla'
        page.fill_in 'author[homepage]', with: 'http://wikipedia.org/Nikola_Tesla'
        find('input[type="submit"]').click
        @alan.reload
        expect(@alan.name).to eq('Nikola Tesla')
        expect(@alan.homepage).to eq('http://wikipedia.org/Nikola_Tesla')
    end
end
