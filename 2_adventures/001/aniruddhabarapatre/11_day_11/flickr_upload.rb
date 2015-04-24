require 'rubygems'
require 'mechanize'

abort "#{$0} login passwd filename" if (ARGV.size != 3)

a = Mechanize.new { |agent|
  # Flickr refreshes after login
  agent.follow_meta_refresh = true
}

a.get('http://flickr.com/') do |home_page|
signin_page = a.click(home_page.link_with(:text => /Sign In/))

  my_page = signin_page.form_with(:name => 'login_form') do |form|
    form.login  = ARGV[0]
    form.passwd = ARGV[1]
  end.submit

 # Click the upload link
  upload_page = a.click(my_page.link_with(:text => /Upload/))

  # We want the basic upload page.
  upload_page = a.click(upload_page.link_with(:text => /basic Uploader/))

  # Upload the file
  upload_page.form_with(:method => 'POST') do |upload_form|
    upload_form.file_uploads.first.file_name = ARGV[2]
  end.submit
end
