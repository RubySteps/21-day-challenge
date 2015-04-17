# Write a program which prints out the lyrics to that beloved classic,
# that field-trip favorite: "99 Bottles of Beer on the Wall."

def bottles_lyrics bottles
  while bottles != 0
    if bottles > 1
      puts "#{bottles} bottles of beer on the wall, #{bottles} bottles of beer.\nTake one down and pass it around, #{bottles - 1} bottles of beer on the wall.\n\n"
    else
      puts "No more bottles of beer on the wall, no more bottles of beer.\nGo to the store and buy some more, #{bottles} bottles of beer on the wall.\n\n"
    end
    bottles -= 1
  end
end

print bottles_lyrics(99)
