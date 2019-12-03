def input_students
students = []
while true do

  puts "would you like to add another student yes or no"
  answer = gets.chomp
  if answer == "yes"

    puts "what is the name of the person"
    name = gets.chomp

    puts "what is the hobby of the student"
    hobby = gets.chomp

    puts "where is this person from"
    location = gets.chomp

    puts "what cohort is this person from"
    cohort = gets.chomp

    students << {name: name, hobby: hobby, location: location, cohort: cohort}


  else
    break
  end

end
students

end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end
def print(students)
    count = 0
    until count == students.length
    puts "#{students[count][:name]}, #{students[count][:cohort]}, #{students[count][:hobby]}, #{students[count][:location]}"
    count += 1
    end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end



# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
