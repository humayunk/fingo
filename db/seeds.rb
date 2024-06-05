# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Clear existing data
Answer.destroy_all
Step.destroy_all
Lesson.destroy_all
Enrollment.destroy_all
Course.destroy_all
UserProgress.destroy_all
User.destroy_all

# Create Users
users = User.create([
  { first_name: "John", last_name: "Doe", nickname: "johndoe", email: "john@example.com", password: "password", xp: 100, streak: 5 },
  { first_name: "Jane", last_name: "Smith", nickname: "janesmith", email: "jane@example.com", password: "password", xp: 150, streak: 7 }
])

# Create Courses
courses = Course.create([
  { title: "Personal Finance 101", description: "Learn the basics of personal finance." },
  { title: "Advanced Investing", description: "Take your investing skills to the next level." }
])

# Create Enrollments
enrollments = Enrollment.create([
  { user: users[0], course: courses[0], status: 'enrolled', enrollment_date: DateTime.now },
  { user: users[1], course: courses[1], status: 'enrolled', enrollment_date: DateTime.now }
])

# Create Lessons
lessons = Lesson.create([
  { title: "Introduction to Personal Finance", content: "This is an introduction.", course: courses[0] },
  { title: "Stock Market Basics", content: "Learn the basics of the stock market.", course: courses[1] }
])

# Create Steps
steps = Step.create([
  { content: "What is a budget?", is_question: true, lesson: lessons[0], order: 1 },
  { content: "Definition of income", is_question: false, lesson: lessons[0], order: 2 },
  { content: "How to buy stocks?", is_question: true, lesson: lessons[1], order: 1 },
  { content: "Different types of stocks", is_question: false, lesson: lessons[1], order: 2 }
])

# Create Answers
answers = Answer.create([
  { content: "A budget is a plan for your money.", is_correct: true, step: steps[0] },
  { content: "Income is the money you earn.", is_correct: true, step: steps[1] },
  { content: "You can buy stocks through a broker.", is_correct: true, step: steps[2] },
  { content: "There are common stocks and preferred stocks.", is_correct: true, step: steps[3] }
])

# Create User Progresses
user_progresses = UserProgress.create([
  { user: users[0], lesson: lessons[0], completed: false, score: 50, current_step: 1 },
  { user: users[1], lesson: lessons[1], completed: false, score: 75, current_step: 2 }
])
