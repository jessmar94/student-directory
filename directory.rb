def interactive_menu
  students = []
  loop do
  # 1. Print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 b/c we'll add more items
  # 2. Read the input and save it into a variable
    user_selection = gets.chomp
  # 3. Do what the user's asked
    case user_selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant, try again please"
    end
  end
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  name = gets.chomp
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    name = gets.chomp
  end
  # Return the array of students
  students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

interactive_menu
