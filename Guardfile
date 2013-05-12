
guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/support/.+\.rb$}) { "spec" }
  watch(%r{^lib/(.+/)?(.+)\.rb$})  { |m| "spec/#{m[2]}_spec.rb" }
  watch('spec/spec_helper.rb')     { "spec" }
end

guard 'rubocop' do
  watch(%r{.+\.rb$})
  watch(%r{(?:.+/)?\.rubocop\.yml$}) { |m| File.dirname(m[0]) }
end

guard 'yard', port: 8808, stdout: 'yard-project.log', stderr: '/dev/null' do
  watch(%r{documentation/.+\.md})
  watch(%r{lib/.+\.rb})
end

guard 'yard', port: 8809, cli: '--gemfile Gemfile', stdout: 'yard-gems.log', stderr: '/dev/null' do
  watch(/Gemfile/)
end
