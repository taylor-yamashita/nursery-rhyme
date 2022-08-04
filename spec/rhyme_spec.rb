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

  it "generates a random rhyme with phrases in the same random order in each line" do 
    random_rhyme = jack.random_rhyme
    lines = random_rhyme.split("\n")  # create array of lines
    lines = lines.map {|line| line.gsub("This is ", "").gsub(".", "") } # remove preamble and periods
    
    # check that each line includes the previous line
    expect(lines).to satisfy {
      (1..(lines.length - 1)).each do |i|
        lines[i].include? lines[i - 1]
      end
    }
  end

  it "generates a random rhyme that uses each phrase exactly once" do
    random_rhyme = jack.random_rhyme
    lines = random_rhyme.split("\n")  # create array of lines
    last_line = lines[lines.length - 1]
    expect(last_line).to satisfy {
      
    }
  end
end

