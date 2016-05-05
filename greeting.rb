greeting = ARGV.shift

ARGV.each do |x|
    puts "#{greeting} #{x}"
end