
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
