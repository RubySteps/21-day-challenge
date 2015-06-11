Today I'm thinking about this code:

<%= form_tag quiz_guess_questions_path, :method => :put do %>	
		<% for question in @survey.questions do %>
			<li><%= h question.content %></li>
				<% for answer in question.answers do %>
					<li><%= h answer.content %>
					       <%= check_box(answer, 'guess', options = {:class => 'guess_name'}, false, true) %>
          </li>
				<% end %>
		<% end %>
	<% end %>
	
	and how to pick the attribute :guess
