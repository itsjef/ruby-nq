require_relative 'util'

if ARGV[0].nil? 
  print "Enter board size: "
  size = gets.chomp.to_i
else
  size = ARGV[0].to_i
end

solutions = arrange Array.new(size)
solutions.each_with_index do |solution,index|
  puts "#{index+1}".center(size*2-1)
  display_board(solution, size)
end
