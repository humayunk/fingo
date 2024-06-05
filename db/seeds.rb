# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

# db/seeds.rb

# Clear existing data in the correct order to avoid foreign key violations
UserProgress.destroy_all
Answer.destroy_all
Step.destroy_all
Lesson.destroy_all
Enrollment.destroy_all
Course.destroy_all
User.destroy_all

# Create Users
users = User.create!([
  { first_name: "John", last_name: "Doe", nickname: "johndoe", email: "john@example.com", password: "password", xp: 100, streak: 5 },
  { first_name: "Jane", last_name: "Smith", nickname: "janesmith", email: "jane@example.com", password: "password", xp: 150, streak: 7 }
])

# Create Courses
courses = Course.create!([
  { title: "Personal Finance 101", description: "Learn the basics of personal finance." },
  { title: "Advanced Investing", description: "Take your investing skills to the next level." },
  { title: "Stock 101", description: "Begin with stocks" }
])

# Create Lessons
lessons = Lesson.create!([
  { title: "Introduction to Personal Finance", content: "This is an introduction.", course: courses[0] },
  { title: "Stock Market Basics", content: "Learn the basics of the stock market.", course: courses[1] },
  { title: "What is a stock?", content: "Introduction to Stocks", course: courses[2] }
])

# Create Steps
steps = Step.create!([
  {
    lesson: lessons[2],
    content: "Definition of a Stock: A stock represents a share in the ownership of a company and constitutes a claim on part of the company's assets and earnings. There are two main types of stock: common and preferred.",
    is_question: false,
    order: 1
  },
  {
    lesson: lessons[2],
    content: "What does a stock represent?",
    is_question: true,
    order: 2
  },
  {
    lesson: lessons[2],
    content: "Why Companies Issue Stocks: Companies issue stocks to raise money for various purposes, such as expanding their business, paying off debt, or funding new projects. This process is known as an initial public offering (IPO).",
    is_question: false,
    order: 3
  }
])

# Create Answers
answers = Answer.create!([
  {
    step: steps[1],
    content: "A) A loan to a company",
    is_correct: false
  },
  {
    step: steps[1],
    content: "B) A share in the ownership of a company",
    is_correct: true
  },
  {
    step: steps[1],
    content: "C) A company's debt",
    is_correct: false
  },
  {
    step: steps[1],
    content: "D) A fixed interest rate investment",
    is_correct: false
  }
])

# Create Enrollments with boolean status
enrollments = Enrollment.create!([
  { user: users[0], course: courses[0], completed: true, enrollment_date: DateTime.now },
  { user: users[1], course: courses[1], completed: true, enrollment_date: DateTime.now },
  { user: users[0], course: courses[2], completed: false, enrollment_date: DateTime.now },
  { user: users[1], course: courses[2], completed: false, enrollment_date: DateTime.now }
])

# Create User Progresses
user_progresses = UserProgress.create!([
  { user: users[0], lesson: lessons[0], completed: false, score: 50, current_step: 1 },
  { user: users[1], lesson: lessons[1], completed: false, score: 75, current_step: 2 },
  { user: users[0], lesson: lessons[2], completed: false, score: 50, current_step: 1 },
  { user: users[1], lesson: lessons[2], completed: false, score: 75, current_step: 2 }
])
