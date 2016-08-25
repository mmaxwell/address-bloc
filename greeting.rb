# The instructions didn't say to wrap this in a function
# so I'm not doing that

# Prior to learning about ARGV.shift

# Is there a better way here?
# greeting = ""
# We assume the first argument is always the greeting
# ARGV.each_with_index do | arg, index |
#     if index == 0
#         greeting = arg
#     else
#         puts "#{greeting} #{arg}"
#     end
# end

# I Couldn't seem to find where it talked about shift.
# I looked in the Array section, but maybe I missed it.
# The gist of this is that I can use array methods on ARGV, correct?
greeting = ARGV.shift

ARGV.each do | name |
    puts "#{greeting} #{name}"
end