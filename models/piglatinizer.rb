class PigLatinizer

  def to_pig_latin(sentence)
    sentence.split(" ").collect do |word|
      piglatinize(word)
    end.join(" ").to_s
  end

  def piglatinize(word)
    letters = word.split("")

    case letters.first.downcase
    when 'a', 'e', 'i', 'o', 'u'
      return latinize(word)
    end

    if has_vowel?(word)
      latinize_with_vowel(word)
    else
      latinize(word)
    end
  end

  def has_vowel?(word)
    size = word.scan(/[aeiou]/).count
    size > 0
  end

  def get_first_vowel(word)
    count = 0

    word.split("").each do |letter|
      count += 1
      if has_vowel?(letter)
        return count
      end
    end
  end

  def latinize_with_vowel(word)
    holder = []
    letters = word.split("")

    (get_first_vowel(word)-1).times do |index|
      holder <<  letters.shift
    end

    latin = letters + holder
    latin.join("")+"ay"
  end

  def latinize(word)
    word + "way"
  end
end
