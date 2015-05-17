# Paperclip
## Steps to install Paperclip in Rails App.

1- Visit [https://github.com/thoughtbot/paperclip]
### Gemfile 
	`gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git”`
3- Add to Model 

### Models
  `has_attached_file :image, styles:{large: "600x600>",medium: "300x300>",small: "150x150#"},`
  `url: "/assets/:class/:id/:style.:extension”,
  `path: ":rails_root/public/assets/:class/:id/:style.:extension”`
  `validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/`
  `validates_attachment_presence :image`
  `validates_attachment_file_name :image, matches: [/png\Z/, /jpe?g/]`
  `validates_attachment_size :image, less_than: 3.megabytes`

### Migrations
- migration generator: `rails generate paperclip user avatar`

### Controller
`def create`
  `@user = User.create( user_params )`
`end`

`private`

`# Use strong_parameters for attribute whitelisting`
`# Be sure to update your create() and update() controller methods.`

`def user_params`
 `params.require(:user).permit(:avatar)`
`end`

### Show View
`= image_tag @user.avatar.url`
`= image_tag @user.avatar.url(:medium)`
`= image_tag @user.avatar.url(:thumb)`