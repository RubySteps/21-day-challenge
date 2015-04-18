require_relative './git_wrapper.rb'

module RailsWrapper

  def self.create_app app_name
    system "rails new #{app_name}"
  end

  def self.generate_scaffold name, attributes
    system "rails g scaffold #{name} #{attributes}"
    system "rake db:migrate"
    GitWrapper.commit_all_changes "generated scaffold for #{name}"
  end

  def self.start_server port
    system "rails s -p #{port}"
  end

  def self.add_has_many model, children
    model_file_path = "app/models/#{model.downcase}.rb"
    model_code = File.read model_file_path
    changed_model_code = model_code.chomp.chomp("end")+ "  has_many :#{children}\nend\n"
    File.write model_file_path, changed_model_code
  end

end
