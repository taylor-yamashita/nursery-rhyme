require "spec_helper"
require_relative "../rhyme"

describe JacksHouse do
  subject(:jack) { JacksHouse.new }

  # TESTING NORMAL RHYME

  it "generates a normal nursery rhyme" do
    rhyme = File.read("rhyme.txt")
    expect(jack.normal_rhyme).to eq(rhyme)
  end

  # TESTING RANDOMIZED RHYME

  it "generates a randomized nursery rhyme" do
    random_rhyme_1 = jack.random_rhyme
    random_rhyme_2 = jack.random_rhyme
    expect(random_rhyme_1).not_to eq(random_rhyme_2)
  end

  it "generates a randomized rhyme with phrases in the same random order in each line" do
    random_rhyme = jack.random_rhyme
    lines = random_rhyme.split("\n") # create array of lines
    lines = lines.map { |line| line.gsub("This is ", "").delete(".") } # remove preamble and periods

    # check that each line includes the previous line
    expect(lines).to satisfy {
      (1..(lines.length - 1)).each do |i|
        lines[i].include? lines[i - 1]
      end
    }
  end

  it "generates a randomized rhyme that uses every phrase once" do
    random_rhyme = jack.random_rhyme
    lines = random_rhyme.split("\n") # create array of lines
    last_line = lines[lines.length - 1]
    expect(last_line).to satisfy {
      jack.normal_phrases.each do |phrase|
        last_line.include? phrase
      end
    }
  end

  # TESTING SEMI-RANDOMIZED RHYME

  it "generates a semi-randomized nursery rhyme" do
    semi_random_1 = jack.semi_random_rhyme
    semi_random_2 = jack.semi_random_rhyme
    expect(semi_random_1).not_to eq(semi_random_2)
  end

  it "generates a semi-randomized rhyme ending with 'the house that Jack built'" do
    semi_random_rhyme = jack.semi_random_rhyme
    jack_phrase = jack.normal_phrases[0]  # "the house that Jack built"
    lines = semi_random_rhyme.split("\n")
    expect(lines).to satisfy {
      lines.each do |line|
        line.end_with?(jack_phrase + ".")
      end
    }
  end
end
