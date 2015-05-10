Today I'm thinking about this code:

<%= link_to t('.start', :default => t("helpers.links.start")),
             question_path(:id => @survey.id, :survey_id => @survey.id), :class => 'btn btn-primary'  %>
