#litte fix for a stack overflow question.
Rails.application.config.middleware.insert_after Rack::ETag, Rack::Saml,
{
  :metadata => "#{Rails.root}/config/metadata.yml",
  :config => "#{Rails.root}/config/rack-saml.yml"
}
