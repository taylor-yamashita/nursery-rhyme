class JacksHouse
  # generate normal nursery rhyme
  def normal_rhyme
    construct_rhyme(base_phrases)
  end

  # generate randomized nursery rhyme
  def random_rhyme
    random_phrases = base_phrases.shuffle
    construct_rhyme(random_phrases)
  end

  private

  # nursery rhyme components
  def base_phrases
    ["the house that Jack built",
      "the malt that lay in",
      "the rat that ate",
      "the cat that killed",
      "the dog that worried",
      "the cow with the crumpled horn that tossed",
      "the maiden all forlorn that milked",
      "the man all tattered and torn that kissed",
      "the priest all shaven and shorn that married",
      "the rooster that crowed in the morn that woke",
      "the farmer sowing his corn that kept",
      "the horse and the hound and the horn that belonged to"]
  end

  def construct_rhyme(phrases)
    rhyme = []
    (0..(phrases.length - 1)).each do |i|
      line = ["This is"]
      j = i
      while j >= 0
        line << phrases[j]
        j -= 1
      end
      rhyme << line.join(" ") + "."
    end
    rhyme.join("\n")
  end
end


j = JacksHouse.new
puts j.random_rhyme
