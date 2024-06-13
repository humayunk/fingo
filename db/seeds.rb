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
  { first_name: "Ryan", last_name: "Smith", nickname: "ryansmith", email: "ryan@example.com", password: "password", coins: 0, streak: 0 },
  { first_name: "Humayun", last_name: "Smith", nickname: "humayunsmith", email: "humayun@example.com", password: "password", coins: 500, streak: 5 },
  { first_name: "Vaeda", last_name: "Smith", nickname: "vaedasmith", email: "vaeda@example.com", password: "password", coins: 350, streak: 2 },
  { first_name: "Jeff", last_name: "Smith", nickname: "jeffsmith", email: "jeff@example.com", password: "password", coins: 750, streak: 4 },
  { first_name: "Juliette", last_name: "Smith", nickname: "juliettesmith", email: "juliette@example.com", password: "password", coins: 1000, streak: 20 }
])

# Create Courses
# Create Courses
courses = Course.create!([
  { title: "Personal Finance 101", description: "Learn the basics of personal finance.", image_name: "personal_finance_101.jpg" },
  { title: "Advanced Investing", description: "Take your investing skills to the next level.", image_name: "advanced_investing.jpg" },
  { title: "Stock 101", description: "Begin with stocks", image_name: "stock_101.jpg" }
])

# Create Lessons for the first course
lessons = Lesson.create!([
  { title: "Mastering Financial Basics", content: "Master the art of managing your money effectively.", course: courses[0], order_rank: 1 },
  { title: "Budgeting Like a Pro", content: "Learn advanced budgeting techniques.", course: courses[0], order_rank: 2 },
  { title: "Smart Saving Strategies", content: "Discover effective ways to save more money.", course: courses[0], order_rank: 3 },
  { title: "Effective Debt Management", content: "Strategies for managing and reducing debt.", course: courses[0], order_rank: 4 },
  { title: "Investment Fundamentals", content: "The basics of investing your money wisely.", course: courses[0], order_rank: 5 }
])

# Create Steps and Answers for the first lesson
steps_and_answers = [
  {
    lesson: lessons[0],
    steps: [
      { category: :tutorial, title: "Introduction to Personal Finance", content: "Welcome to the world of financial adulting! No more splurging all your paycheck on takeout. Understanding personal finance means you'll be able to manage your income, expenses, savings, and investments like a pro", image_name: "financial_intro.jpg", order: 1 },
      { category: :choice, content: "What's a smart reason to manage your personal finances?", order: 2, answers: [
        { content: "To avoid thinking about money", is_correct: false },
        { content: "To buy more designer clothes", is_correct: false },
        { content: "To achieve financial stability", is_correct: true },
        { content: "To impress your friends", is_correct: false }
      ]},
      { category: :tutorial, title: "Essential Financial Skills", content: "Key skills include tracking your income and expenses, setting financial goals (like paying off that massive student loan), creating a budget, saving for emergencies, and making smart investment choices. Regular reviews ensure you stay on track", image_name: "financial_skills.jpg", order: 3 },
      { category: :fill, content: "Good personal finance helps in managing ______ and ______", order: 4, answers: [
        { content: "income", is_correct: true, order: 1 },
        { content: "Netflix", is_correct: false },
        { content: "coffee budget", is_correct: false },
        { content: "expenses", is_correct: true, order: 2 }
      ]},
      { category: :tutorial, title: "Summary and Next Steps", content: "In summary, mastering personal finance is your ticket to living stress-free and achieving your dreams. With a solid grip on budgeting, saving, and investing, you'll be on your way to financial independence. Time to boss up your finances", image_name: "summary.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[1],
    steps: [
      { category: :tutorial, title: "Advanced Budgeting Techniques", content: "Budgeting is essential. It's not just about limiting your avocado toast intake but planning where every dollar goes. Master this, and you'll never wonder why you're broke before payday", image_name: "budgeting.jpg", order: 1 },
      { category: :choice, content: "What is crucial for effective budgeting?", order: 2, answers: [
        { content: "Ignoring small expenses", is_correct: false },
        { content: "Only planning for big purchases", is_correct: false },
        { content: "Tracking all income and expenses", is_correct: true },
        { content: "Avoiding financial goals", is_correct: false }
      ]},
      { category: :tutorial, title: "Key Budgeting Strategies", content: "Effective budgeting strategies include categorizing expenses, setting realistic goals, using budgeting tools, and regularly reviewing your budget. This helps avoid those 'how am I broke again?' moments", image_name: "budgeting_strategies.jpg", order: 3 },
      { category: :fill, content: "A good budget helps in tracking ______ and achieving ______", order: 4, answers: [
        { content: "expenses", is_correct: true, order: 1 },
        { content: "Insta fame", is_correct: false },
        { content: "goals", is_correct: true, order: 2 },
        { content: "pizza fund", is_correct: false }
      ]},
      { category: :tutorial, title: "Maintaining Your Budget", content: "Keeping your budget in check requires discipline. Review it monthly and adjust for any changes. Use apps to make this easier and keep you from falling off the financial wagon", image_name: "maintaining_budget.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[2],
    steps: [
      { category: :tutorial, title: "Effective Saving Strategies", content: "Saving money isn't about hoarding cash under your mattress. It's about setting aside funds for future needs, emergencies, and investments. The goal? Financial security without living like a hermit", image_name: "saving_strategies.jpg", order: 1 },
      { category: :choice, content: "What defines an emergency fund?", order: 2, answers: [
        { content: "A fund for vacations", is_correct: false },
        { content: "A fund for unexpected expenses", is_correct: true },
        { content: "A fund for luxury items", is_correct: false },
        { content: "A fund for investments", is_correct: false }
      ]},
      { category: :tutorial, title: "Types of Savings Accounts", content: "Different savings accounts serve different needs. High-yield accounts offer better interest rates, while regular accounts are more accessible. CDs lock your money for a set time but often provide higher returns", image_name: "savings_accounts.jpg", order: 3 },
      { category: :fill, content: "Effective saving involves setting ______ goals and ______ regularly", order: 4, answers: [
        { content: "saving", is_correct: true, order: 2 },
        { content: "realistic", is_correct: true, order: 1 },
        { content: "life", is_correct: false },
        { content: "shopping", is_correct: false }
      ]},
      { category: :tutorial, title: "Maximizing Savings", content: "Maximize your savings by automating deposits, using employer-sponsored retirement plans, and hunting for high-interest savings accounts. Regularly review and adjust your saving strategies to stay on track", image_name: "max_savings.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[3],
    steps: [
      { category: :tutorial, title: "Introduction to Debt Management", content: "Debt management is about handling debt so it doesn't handle you. Prioritize high-interest debt and develop a plan to reduce and eliminate it. It's like tackling a big project—one step at a time", image_name: "debt_management.jpg", order: 1 },
      { category: :choice, content: "What's a smart way to manage debt?", order: 2, answers: [
        { content: "Ignoring it", is_correct: false },
        { content: "Paying more than the minimum payment", is_correct: true },
        { content: "Taking out more loans", is_correct: false },
        { content: "Using all your savings", is_correct: false }
      ]},
      { category: :tutorial, title: "Prioritizing Debt Repayment", content: "Focus on paying off high-interest debt first. Use the debt avalanche or debt snowball methods to systematically reduce what you owe. Every bit helps in shrinking that debt monster", image_name: "debt_priorities.jpg", order: 3 },
      { category: :fill, content: "Managing debt involves ______ high-interest debt and making ______ payments", order: 4, answers: [
        { content: "extra", is_correct: true, order: 2 },
        { content: "minimum", is_correct: false },
        { content: "prioritizing", is_correct: true, order: 1 },
        { content: "avoiding", is_correct: false }
      ]},
      { category: :tutorial, title: "Avoiding Future Debt", content: "To avoid future debt, live within your means, avoid impulse buys, and build an emergency fund. Financial discipline and smart choices keep you debt-free and stress-free", image_name: "avoid_debt.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[4],
    steps: [
      { category: :tutorial, title: "Introduction to Investing", content: "Investing is about making your money work for you. It involves buying assets like stocks, bonds, and real estate with the expectation of earning a return. The goal? Grow your wealth over time and achieve financial freedom", image_name: "investing_intro.jpg", order: 1 },
      { category: :choice, content: "What's a key benefit of investing?", order: 2, answers: [
        { content: "Avoiding taxes", is_correct: false },
        { content: "Eliminating all risk", is_correct: false },
        { content: "Growing your wealth over time", is_correct: true },
        { content: "Getting rich quick", is_correct: false }
      ]},
      { category: :tutorial, title: "Types of Investments", content: "Investments come in various forms: stocks offer high returns but high risk, bonds provide steady income with lower risk, and real estate can yield rental income and appreciation. Diversify to balance risk and reward", image_name: "investment_types.jpg", order: 3 },
      { category: :fill, content: "Investing involves buying ______ with the expectation of earning a ______", order: 4, answers: [
        { content: "NFTs", is_correct: false },
        { content: "assets", is_correct: true, order: 1 },
        { content: "fortune", is_correct: false },
        { content: "return", is_correct: true, order: 2 }
      ]},
      { category: :tutorial, title: "Summary of Investing", content: "Investing is essential for building wealth and achieving financial goals. By investing in a mix of assets, you can grow your wealth over time and protect against inflation. Do your research, stay patient, and think long-term", image_name: "investing_summary.jpg", order: 5 }
    ]
  }
]

steps_and_answers.each do |lesson_data|
  lesson = lesson_data[:lesson]
  lesson_data[:steps].each do |step_data|
    answers = step_data.delete(:answers)
    step = Step.create!(step_data.merge(lesson: lesson))
    answers&.each do |answer_data|
      Answer.create!(answer_data.merge(step: step))
    end
  end
end
