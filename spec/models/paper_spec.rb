require 'rails_helper'

RSpec.describe Paper, type: :model do
  it "should have title, venue and year" do
    paper = Paper.new()
    paper.title = 'Test Paper'
    paper.venue = 'Potsdam'
    paper.year = 2021
    expect(paper.title).to eq('Test Paper')
    expect(paper.venue).to eq('Potsdam')
    expect(paper.year).to eq(2021)
  end

  it "should have an empty list of authors" do
    paper = Paper.new()
    expect(paper.authors).to eq([])
  end
end
