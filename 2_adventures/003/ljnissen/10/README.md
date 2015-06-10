Today I'm thinking about old Railscasts.

Why did this work before but not now?

<%= link_to t('Next question', :default => t("helpers.links.next")),
             {:action => 'show', :id => @survey.next, :survey_id => @survey.id}, :method => :put, :class => 'btn btn-default' %>
