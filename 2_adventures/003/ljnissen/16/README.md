Today I'm thinking about unchecking checkboxes:

    <%= form_tag quiz_guess_questions_path, :method => :put do %>
  		<% for question in @survey.questions do %>
  			<li><%= question.content %></li>
  				<% for answer in question.answers do %>
              <li>
                <%= fields_for "answers[]", answer do |f| %>
                  <%= answer.content %>  
                  <%= f.check_box :guess, :checked => false %>    
                <% end %>
              </li>
  				<% end %>
  		<% end %>
     <%= submit_tag "Guess" %>
    <% end %>
