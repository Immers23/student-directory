require "csv"
@students = []
@choosen_file = ""
@filename = "students.csv"
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
  answer = STDIN.gets.strip
  if answer == "yes"

    puts "what is the name of the person"
    name = STDIN.gets.strip
    if name.empty?
      name = "None"
    end

    puts "what cohort is this person from"
    cohort = months[STDIN.gets.capitalize.strip]
      while cohort == nil
        puts "please type your cohort month again"
        cohort = months[STDIN.gets.capitalize.strip]
      end

    add_students(name, cohort)

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
print = STDIN.gets.strip.downcase

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
  puts "4. Load the list from students.csv"
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
      choose_file
      save_students
    when "4"
      choose_file
      @students = []
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  # open the file for writing
  CSV.open("./#{@choosen_file}", "w") do |line|
  # iterate over the array of save_students
  @students.each do |student|
    student_data = [student[:name]], student[:cohort]
    line << student_data
  end
  puts "students have been saved successfully"
end
end

def default_load
  filename = ARGV.first
  if filename.nil?
  puts "Load default file: students.csv"
  load_students(@filename)
  elsif File.exists?(filename) # if it exists
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else # if it doesn't exist
    puts "Sorry, #{filename} doesn't exist."
    exit # quit the program
  end
end

def load_students(filename = @choosen_file)
  CSV.foreach("./#{filename}") do |row|
    name, cohort = row
    add_students(name, cohort)
  end
  puts "Students have been loaded successfully"
end


def add_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

def choose_file
  puts "which file do you want to load from?"
  @choosen_file = STDIN.gets.chomp
  if @choosen_file.nil? || !File.exists?(@choosen_file)
    puts "File does not exist using file #{@filename}"
    @choosen_file = @filename
  end
end

# nothing happens until we call the methods
default_load
interactive_menu
# save_students
# load_students
# students = input_students
# print_header
# print(students)
# print_footer(students)
# print_by_cohort(students)
