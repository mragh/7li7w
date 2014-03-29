LENGTH = 10
num = rand(10) + 1
puts "Pick a number from 1 to #{LENGTH}"
guess = Integer(gets.chomp)
while guess != num
    if guess > num
        puts "#{guess} is too high"
    else
        puts "#{guess} is too low"
    end
    puts "Guess again"
    guess = Integer(gets.chomp)
end
puts "Correct!"
