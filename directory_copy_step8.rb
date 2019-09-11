def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # Create an empty array
  students = []
  # Get the first name
  # .capitalize so .delete_if condition below works, regardless of user input
  name = gets.chomp.capitalize
  # While the name is not empty, repeat this code
  while !name.empty? do
    # Add the student hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    # Get another name from the user
    name = gets.chomp.capitalize
  end
  # Return the array of students
  # Program modified to only print students whose name begins with specific letter.
  students.delete_if { |student| student[:name][0] != "A" }
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(students)
# Print a number before each name
  students.each.with_index(1) do |student, index|
    puts "#{index}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end

students = input_students
# Nothing happens untill we call the methods
print_header
print(students)
print_footer(students)
