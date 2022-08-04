require "spec_helper"
require_relative "../rhyme"

describe JacksHouse do
  subject(:jack) { JacksHouse.new }

  it "generates a normal nursery rhyme" do
    rhyme = File.read("rhyme.txt")
    expect(jack.normal_rhyme).to eq(rhyme)
  end

  it "generates a randomized nursery rhyme" do
    random_rhyme_1 = jack.random_rhyme
    random_rhyme_2 = jack.random_rhyme
    expect(random_rhyme_1).not_to eq(random_rhyme_2)
  end
end
