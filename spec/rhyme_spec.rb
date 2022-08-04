require "spec_helper"
require_relative "../rhyme"

describe JacksHouse do
  subject(:jack) { JacksHouse.new }

  it "returns a normal nursery rhyme string" do
    rhyme = File.read("rhyme.txt")
    expect(jack.normal_rhyme).to eq(rhyme)
  end

  # it "returns a randomized nursery rhyme string" do
  #   expect(jack.random_rhyme).to eq()
  # end
end
