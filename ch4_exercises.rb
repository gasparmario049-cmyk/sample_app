# ch4_exercises.rb
# Rails Tutorial — Chapter 4 exercises
# Usage: from your Rails app root, in the console:
#   load './ch4_exercises.rb'
# Or:
#   rails runner ch4_exercises.rb

def _section(title)
  puts
  puts "=" * 70
  puts title
  puts "=" * 70
end

# ---------------------------------------------------------------------
_section "4.2.1 Strings"
# ---------------------------------------------------------------------
city  = "Los Angeles"
state = "CA"

puts "#{city}, #{state}"
puts "#{city}\t#{state}"
puts '#{city}\t#{state}'   # single quotes: no interpolation, literal \t

# ---------------------------------------------------------------------
_section "4.2.2 Objects and Message Passing"
# ---------------------------------------------------------------------
puts "length:  #{"racecar".length}"
puts "reverse: #{"racecar".reverse}"

s = "racecar"
puts "s == s.reverse -> #{s == s.reverse}"
puts "It's a palindrome!" if s == s.reverse

s = "onomatopoeia"
puts "It's a palindrome!" if s == s.reverse   # (prints nothing)

# ---------------------------------------------------------------------
_section "4.2.3 Method Definitions"
# ---------------------------------------------------------------------
def palindrome_tester(s)
  if s == s.reverse
    puts "It's a palindrome!"
  else
    puts "It's not a palindrome."
  end
end

palindrome_tester("racecar")
palindrome_tester("onomatopoeia")
puts "palindrome_tester('racecar').nil? -> #{palindrome_tester('racecar').nil?}"

# ---------------------------------------------------------------------
_section "4.3.1 Arrays and Ranges"
# ---------------------------------------------------------------------
a = "A man, a plan, a canal, Panama".split(", ")
p a

s = a.join
puts "joined:      #{s.inspect}"
s = s.split.join
puts "no-space:    #{s.inspect}"

palindrome_tester(s)
palindrome_tester(s.downcase)

# Note: ('z'..'a').to_a is empty, so reverse the array instead.
puts "letter at index 7 (a..z): #{('a'..'z').to_a[7].inspect}"
puts "reverse at index 7:       #{('a'..'z').to_a.reverse[7].inspect}"

# ---------------------------------------------------------------------
_section "4.3.2 Blocks"
# ---------------------------------------------------------------------
(0..16).each { |n| puts 2**n }

def yeller(chars)
  chars.map { |c| c.upcase }.join
end
puts "yeller(['o','l','d']) -> #{yeller(['o','l','d']).inspect}"

def shuffled_subdomain
  ('a'..'z').to_a.shuffle[0..7].join
end
puts "shuffled_subdomain -> #{shuffled_subdomain.inspect}"

def string_shuffle(str)
  str.split('').shuffle.join
end
puts "string_shuffle('foobar') -> #{string_shuffle('foobar').inspect}"

# ---------------------------------------------------------------------
_section "4.3.3 Hashes and Symbols"
# ---------------------------------------------------------------------
spanish = { 'one' => 'uno', 'two' => 'dos', 'three' => 'tres' }
spanish.each do |key, value|
  puts "'#{key}' in Spanish is '#{value}'."
end

person1 = { first: "Michael", last: "Hartl" }
person2 = { first: "Jane",    last: "Doe"   }
person3 = { first: "Kid",     last: "Doe"   }
params  = { father: person1, mother: person2, child: person3 }
puts "params[:father][:first] -> #{params[:father][:first].inspect}"

user = {
  name:            "Michael Hartl",
  email:           "michael@example.com",
  password_digest: ('a'..'z').to_a.sample(16).join
}
p user

p({ "a" => 100, "b" => 200 }.merge({ "b" => 300 }))

# ---------------------------------------------------------------------
_section "4.4.1 Constructors"
# ---------------------------------------------------------------------
p (1..10)
p Range.new(1, 10)
puts "(1..10) == Range.new(1, 10) -> #{(1..10) == Range.new(1, 10)}"

# ---------------------------------------------------------------------
_section "4.4.2 Class Inheritance"
# ---------------------------------------------------------------------
puts "Range.superclass  -> #{Range.superclass}"
puts "Hash.superclass   -> #{Hash.superclass}"
puts "Symbol.superclass -> #{Symbol.superclass}"

class Word < String
  def palindrome?
    self == reverse   # exercise: works with or without self.
  end
end
puts "Word.new('level').palindrome? -> #{Word.new('level').palindrome?}"

# ---------------------------------------------------------------------
_section "4.4.3 Modifying Built-in Classes"
# ---------------------------------------------------------------------
class String
  def palindrome?
    self == reverse
  end

  def shuffle
    split('').shuffle.join
  end
end

p "racecar".palindrome?
p "onomatopoeia".palindrome?
p "Malayalam".downcase.palindrome?
p "foobar".shuffle

# ---------------------------------------------------------------------
_section "4.4.4 Controller Class (toy_app only)"
# ---------------------------------------------------------------------
begin
  obj = User.new
  chain = []
  klass = obj.class
  while klass
    chain << klass.to_s
    klass = klass.superclass
  end
  puts "User#class -> #{obj.class}"
  puts "hierarchy  -> #{chain.join(' < ')}"
rescue NameError => e
  puts "Skipped (no User model in this app): #{e.message}"
end

# ---------------------------------------------------------------------
_section "4.4.5 A User Class (ExampleUser to avoid clobbering)"
# ---------------------------------------------------------------------
class ExampleUser
  attr_accessor :first_name, :last_name, :email

  def initialize(attributes = {})
    @first_name = attributes[:first_name]
    @last_name  = attributes[:last_name]
    @email      = attributes[:email]
  end

  def full_name
    "#{@first_name} #{@last_name}"
  end

  def alphabetical_name
    "#{@last_name}, #{@first_name}"
  end

  def formatted_email
    "#{full_name} <#{@email}>"
  end
end

u = ExampleUser.new(first_name: "Michael", last_name: "Hartl", email: "mhartl@example.com")
puts "full_name         -> #{u.full_name}"
puts "alphabetical_name -> #{u.alphabetical_name}"
puts "formatted_email   -> #{u.formatted_email}"
puts "split-equality    -> #{u.full_name.split == u.alphabetical_name.split(', ').reverse}"

puts
puts "Done."