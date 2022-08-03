class JacksHouse
    def rhyme
        # nursery rhyme components
        phrases = ["the house that Jack built",
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

        # generate nursery rhyme
        rhyme = ""
        for i in 0..(phrases.length()-1)
            string = "This is "
            j = i
            while j >= 0
                string += phrases[j]
                if j != 0 then string += " " end
                j -= 1
            end
            string += "."
            rhyme += string
            if i != phrases.length() - 1 then rhyme += "\n" end
        end
        return rhyme
    end
end
