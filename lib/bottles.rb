class Bottles
  def initialize
  end

  def bottles_left(n)
    case n
    when 1
      "1 bottle"
    when 0
      "no more bottles"
    else
      "#{n} bottles"
    end
  end

  def action(n)
    pronoun = (n == 1) ? "it" : "one"
    if n.zero?
      "Go to the store and buy some more, 99 bottles of beer on the wall."
    else
      "Take #{pronoun} down and pass it around, #{bottles_left (n-1)} of beer on the wall."
    end
  end

  def verse(n)
    ["#{(bottles_left n).capitalize} of beer on the wall, #{bottles_left n} of beer.",
     action(n),
     ""].join("\n")
  end

  def verses(from, to)
    from.downto(to).map {|n| verse(n) }.join("\n")
  end

  def song
    verses(99,0)
  end
end
