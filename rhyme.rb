class JacksHouse
  # generate the original ("normal") nursery rhyme
  def normal_rhyme
    construct_rhyme(normal_phrases)
  end

  # generate a nursery rhyme with phrases in randomized order
  def random_rhyme
    random_phrases = normal_phrases.shuffle
    construct_rhyme(random_phrases)
  end

  private

  # store array of nursery rhyme phrases in original ("normal") order
  def normal_phrases
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

  # given an array of phrases, construct and return nursery rhyme string
  def construct_rhyme(phrases)
    rhyme = []
    (0..(phrases.length - 1)).each do |i|
      line = []
      (0..i).each do |j|
        line << phrases[j] 
      end
      rhyme << "This is " + line.reverse.join(" ") + "."
    end
    rhyme.join("\n")
  end
end