require 'rails_helper'

describe Author, type: :model do
  it "should have first_name, last_name, homepage and name" do
    author = Author.new()
    author.first_name = 'Alan'
    author.last_name = 'Turing'
    author.homepage = 'http://wikipedia.org/Alan_Turing'
    expect(author.first_name).to eq('Alan')
    expect(author.last_name).to eq('Turing')
    expect(author.homepage).to eq('http://wikipedia.org/Alan_Turing')
    expect(author.name).to eq('Alan Turing')
  end
end
