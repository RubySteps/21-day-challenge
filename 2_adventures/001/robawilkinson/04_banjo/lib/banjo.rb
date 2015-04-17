class Banjo
  def self.notes(chord)
    scale = %w{ a a# b c c# d d# e f f# g g#}
    output = []
    if chord[-1] === 'm'
      starting_index = scale.index(chord[0])
      output << scale[starting_index]
      output << scale[(starting_index + 3) % scale.count]
      output << scale[(starting_index + 7)% scale.count]

    else
      starting_index = scale.index(chord.downcase)
      output << scale[starting_index]
      output << scale[(starting_index + 4)% scale.count]
      output << scale[(starting_index + 7) % scale.count]
    end
    return output
  end
  def self.shape(chord = nil)
    output = ""
    if chord == nil
      shape = %{
      D|G|B|D
      -|-|-|-
      -|-|-|-
      -|-|-|-
      -|-|-|-
      }
      return shape
    else
     notes = self.notes(chord)
     # open strings are these notes
     open = ['d','g','b','d']
     # first fret are
     first_fret = ['d#','g#','c','d#']
     # second_fret notes
     second_fret = ['e','a','c#','e']
     # third_fret notes
     third_fret = ['f','a#','d','f']
     # fourth_fret notes
     fourth_fret = ['f#','b','d#','f#']
     frets = []
     frets << open
     frets << first_fret
     frets << second_fret
     frets << third_fret
     frets << fourth_fret
     open.each do |string|
       notes.each do |note|
         if string == note
           output << 'x'
         else
           output << '-'
         end
         output << '|'
       end
     end
    end
    return output
  end
end
