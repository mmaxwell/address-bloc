# The instructions didn't say to wrap this in a function
# so I'm not doing that

# Is there a better way here?
greeting = ""

# We assume the first argument is always the greeting
ARGV.each_with_index do | arg, index |
    if index == 0
        greeting = arg
    else
        puts "#{greeting} #{arg}"
    end
end