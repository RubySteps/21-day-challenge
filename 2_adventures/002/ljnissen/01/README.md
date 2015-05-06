   <%= link_to(questions_path({:controller => 'questions', :action => :index, :survey_id => survey.id }), :class => 'btn btn-xs') do %>
            <%= glyph 'th-list' %>
   <%- end -%>
