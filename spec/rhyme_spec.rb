require "spec_helper"
require_relative "../rhyme"

describe JacksHouse do
  subject(:jack) { JacksHouse.new }

  it "returns nursery rhyme string" do
    rhyme = File.read("rhyme.txt")
    expect(jack.normal_rhyme).to eq(rhyme)
  end
end
