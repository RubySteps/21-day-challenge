Today I want to submit data via one controller while viewing the data via another controller. 

  <%= link_to t('Next question', :default => t("helpers.links.next"),
            surveys_path = {:action => 'show', :id => @survey.next, :survey_id => @survey.id}, answer_path = {:id => :guess, :method => :post}), :class => 'btn btn-default' %>
