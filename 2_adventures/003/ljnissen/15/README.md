Today I figured out how to use field_for.

In view:

    <%= form_tag quiz_guess_questions_path, :method => :put do %>
  		<% for question in @survey.questions do %>
  			<li><%= question.content %></li>
  				<% for answer in question.answers do %>
              <li>
                <%= fields_for "answers[]", answer do |f| %>
                  <%= answer.content %>  
                  <%= f.check_box :guess %>    
                <% end %>
              </li>
  				<% end %>
  		<% end %>
     <%= submit_tag "Guess" %>
    <% end %>
    
and in controller:

  def quiz_guess
    Answer.update(params[:answers].keys, params[:answers].values)
    flash[:notice] = "Guess saved successfully."
    redirect_to questions_url
  end

