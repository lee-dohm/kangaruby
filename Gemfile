source 'https://rubygems.org'

gemspec

# Gems only used for interactive development
group :development do
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-rubocop'
  gem 'redcarpet'      # Not needed in test because CI environment doesn't generate documentation

  # For users of OS X, include the proper requirements for file system events and notifications
  if RUBY_PLATFORM.downcase.include?('darwin')
    if `sw_vers -productVersion` =~ /^10\.8/
      gem 'terminal-notifier-guard'
    else
      gem 'growl'
    end

    gem 'rb-fsevent'
  end
end

# Gems used for both interactive development and the CI environment
group :test do
  gem 'bundler', '~> 1.3'
  gem 'coveralls'
  gem 'equivalent-xml'
  gem 'factory_girl'
  gem 'fuubar'
  gem 'rake'
  gem 'rspec'
  gem 'rubocop', git: 'git://github.com/bbatsov/rubocop.git'
  gem 'simplecov'
  gem 'term-ansicolor'
  gem 'yard'
end
