@students = []

def interactive_menu
	loop do
		print_menu
		process(gets.chomp)
	end
end

def print_menu
	puts "1. Input the students"
	puts "2. Show the students"
	puts "3. Save the list to students.csv"
	puts "4. Load the list from students.csv"
	puts "9. Exit"
end

def show_students
	print_header
	print_student_list
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
		when "4"
			load_students
		when "9"
			exit
		else 
			puts "I don't know what you mean, try again"
	end
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	name = gets.chomp

	while !name.empty? do
		puts "What cohort are they"
		cohort = gets.chomp

			@students << {name: name, cohort: cohort}

		if @students.count == 1
	  	puts "Now we have #{@students.count} student"
		else
			puts "Now we have #{@students.count} students"
		end
		puts "Enter another student name"
		name = gets.chomp
	end
	@students
end

def print_header
	puts "The students of Villains Academy".center(100)
	puts "-------------".center(100)
end

def print_student_list
	@students.each_with_index do |student, index|
	 	puts "#{index + 1}. #{student[:name]}, #{student[:cohort]} cohort".center(100)
	end
end

def print_footer
		if @students.count == 1
	  	puts "Overall, we have #{@students.count} great student".center(100)
		else
			puts "Overall, we have #{@students.count} great students".center(100)
		end
end

def save_students
	file = File.open("students.csv", "w")
	@students.each do |student|
		student_data = [student[:name], student[:cohort]]
		csv_line = student_data.join(",")
		file.puts csv_line
	end
	file.close
end

def load_students
	file = File.open("students.csv", "r")
	file.readlines.each do |line|
	name, cohort = line.chomp.split(',')
		@students << {name: name, cohort: cohort}
	end
	file.close
end

interactive_menu