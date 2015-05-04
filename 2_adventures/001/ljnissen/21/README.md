Today I'm thinking about option helpers and how they are written:

<%= f.select(:name, @surveys.map {|s| [s.name, s.id]}) %>
