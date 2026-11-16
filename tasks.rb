# ============================================================
# Упражнение 1. Функция string_shuffle
# ============================================================
puts "=== Упражнение 1. string_shuffle ==="

def string_shuffle(s)
  s.split('').shuffle.join
end

puts string_shuffle("foobar")
puts


# ============================================================
# Упражнение 2. Метод shuffle у класса String
# ============================================================
puts "=== Упражнение 2. String#shuffle ==="

class String
  def shuffle
    self.split('').shuffle.join
  end
end

puts "foobar".shuffle
puts


# ============================================================
# Упражнение 3. Вложенные хэши в params
# ============================================================
puts "=== Упражнение 3. Вложенные хэши ==="

person1 = { first: "Иван",    last: "Петров" }
person2 = { first: "Мария",   last: "Сидорова" }
person3 = { first: "Николай", last: "Петров" }

params = {
  father: person1,
  mother: person2,
  child:  person3
}

puts "params[:father][:first] => #{params[:father][:first]}"
puts "params[:mother][:first] => #{params[:mother][:first]}"
puts "params[:child][:first]  => #{params[:child][:first]}"
puts


# ============================================================
# Упражнение 4. Hash#merge
# ============================================================
puts "=== Упражнение 4. Hash#merge ==="

h = { "a" => 100, "b" => 200 }
merged = h.merge({ "b" => 300 })

puts "Исходный h:        #{h}"
puts "h.merge(b: 300):   #{merged}"
puts "h после merge:     #{h}  (не изменился)"

h.merge!({ "b" => 300 })
puts "h после merge!:    #{h}  (изменился на месте)"