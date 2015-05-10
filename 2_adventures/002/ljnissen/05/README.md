# The navigation of my app is shaping up, but I still have loads to learn.

<h1>Welcome to Quizzes</h1>

<h3>Press start to begin</h3>

<%= link_to t('.start', :default => t("helpers.links.start")),
             question_path(:id => @survey.id, :survey_id => @survey.id), :class => 'btn btn-primary'  %>
