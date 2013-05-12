
guard 'rspec' do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/support/.+\.rb$}) { "spec" }
  watch(%r{^lib/(.+/)?(.+)\.rb$})  { |m| "spec/#{m[2]}_spec.rb" }
  watch('spec/spec_helper.rb')     { "spec" }
end

guard 'yard', port: 8808, cli: '--gems' do
  watch(%r{documentation/.+\.md})
  watch(%r{lib/.+\.rb})
end
