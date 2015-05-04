 <%= link_to("questions", { :controller => 'surveys', :survey_id => survey.id }, :class => 'btn btn-xs', 
            :title => "#{ t('.index', :default => t('helpers.links.index')) }") do %>
      <%= glyph 'th-list' %>
  <%- end -%>
