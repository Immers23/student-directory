@students = []
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

    @students << {name: name, cohort: cohort}

    else
    break
  end
end

end

def print_header
  puts "The students of Villains Academy".center(100)
  puts "-------------"
end

def print_student_lists
    count = 0
    until count == @students.length
    puts "#{@students[count][:name]}, #{@students[count][:cohort]}"
    count += 1
    end
end



def print_by_cohort

puts "what cohort would you like to print"
print = gets.strip.downcase

@students.each do |hash|
puts hash[:name] if hash[:cohort] == print.to_sym

end

end



def print_footer
  if @students.length == 1
    puts "we have one great student"
  elsif @students.length == 0
    puts "we have no students"
  else
    puts "Overall, we have #{@students.count} great students"
  end
end

def print_menu
  puts "1. Input the student"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "9. Exit"
end

def show_students
  print_header
  print_student_lists
  print_footer
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of save_students
  @students.each do |student|
    student_data = [student[:name]], student[:cohort]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end
# nothing happens until we call the methods
interactive_menu
save_students
# students = input_students
# print_header
# print(students)
# print_footer(students)
# print_by_cohort(students)
