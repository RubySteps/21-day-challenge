Today I'm thinking about this code and if it will work:

  <%= link_to t('Next question', :default => t("helpers.links.next")),
            surveys_path({:action => 'show', :id => @survey.next, :survey_id => @survey.id}), answers_path(:guess, @answer), :method => :post, :class => 'btn btn-default' %>
