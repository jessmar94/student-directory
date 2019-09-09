# Declare an empty array accessible to all methods
@students = []

# Extract code that prints the menu into its own method
def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 b/c we'll add more items
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

# Extract case statement into a new method.
def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit # This causes the program to terminate
  else
    puts "I don't know what you meant, please try again"
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Get the first name
  name = STDIN.gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # Get another name from the user
    name = STDIN.gets.chomp
  end
end

# Extract code that prints the students into a method
def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

# Save the list of students to a CSV file.
def save_students
  # Open the file for writing
  file = File.open("students.csv", "w")
  # Iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# Load the data from the file
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first # First argument from the command line
  return if filename.nil? # Get out of the method if it isn't given
  if File.exists?(filename) # If it exists...
    load_students(filename)
      puts "Loaded #{@students.count} from #{filename}"
    else # If it doesn't exist...
      puts "Sorry, #{filename} doesn't exist."
      exit # Quite the program
    end
end

try_load_students # Loads the data if you do $ ruby directory.rb students.csv
interactive_menu
