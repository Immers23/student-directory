def input_students

months = { "" => :none,
  "January" => :january,
  "February" => :february,
  "March" => :march,
  "April" => :april,
  "May" => :may,
  "June" => :june,
  "July" => :july,
  "August" => :august,
  "September" => :september,
  "October" => :october,
  "November" => :november,
  "December" => :december}

students = []
while true do

  puts "would you like to add another student yes or no"
  answer = gets.strip
  if answer == "yes"

    puts "what is the name of the person"
    name = gets.strip
    if name.empty?
      name = "None"
    end

    puts "what cohort is this person from"
    cohort = months[gets.capitalize.strip]
      while cohort == nil
        puts "please type your cohort month again"
        cohort = months[gets.capitalize.strip]
      end

    students << {name: name, cohort: cohort}

    else
    break
  end

end
students

end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------"
end

def print(students)
    count = 0
    until count == students.length
    puts "#{students[count][:name]}, #{students[count][:cohort]}"
    count += 1
    end
end

def print_by_cohort(students)

puts "what cohort would you like to print"
print = gets.strip.downcase

students.each do |hash|
puts hash[:name] if hash[:cohort] == print.to_sym

end

end



def print_footer(students)
  if students.length == 1
    puts "we have one great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end


# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)
print_by_cohort(students)
