
guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/support/.+\.rb$}) { "spec" }
  watch(%r{^lib/(.+/)?(.+)\.rb$})  { |m| "spec/#{m[2]}_spec.rb" }
  watch('spec/spec_helper.rb')     { "spec" }
end
