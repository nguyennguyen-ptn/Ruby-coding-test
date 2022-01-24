require_relative './lib/application'

begin
  Application.run!('inputs/input1.txt')
rescue RuntimeError => e
  puts 'An eror occurs while running the application:'
  puts e.message
end
