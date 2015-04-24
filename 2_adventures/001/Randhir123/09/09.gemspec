# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
	spec.name			= "09"
	spec.version		= '1.0'
	spec.authors		= ["Randhir Singh"]
	spec.email			= ["randhirkumar.singh@gmail.com"]
	spec.summary 		= %q{Short summary of your project.}
	spec.description	= %q{Longer description of your project.}
	spec.homepage		= "http://domainforproject.com/"
	spec.license		= "MIT"
	
	spec.files			= ['lib/09.rb']
	spec.executables	= ['bin/09']
	spec.test_files		= ['tests/test_09.rb']
	spec.require_paths	= ['lib']
end
	