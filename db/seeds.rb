# db/seeds.rb

# Clear existing data in the correct order to avoid foreign key violations
UserItem.destroy_all
UserProgress.destroy_all
Answer.destroy_all
Step.destroy_all
Lesson.destroy_all
Enrollment.destroy_all
Course.destroy_all
User.destroy_all
Item.destroy_all

# Create Users
users = User.create!([
  { first_name: "Ryan", last_name: "Smith", nickname: "ryansmith", email: "ryan@example.com", password: "password", coins: 0, streak: 0, avatar: "grumpy_cat2.jpg" },
  { first_name: "Humayun", last_name: "Smith", nickname: "humayunsmith", email: "humayun@example.com", password: "password", coins: 500, streak: 5, avatar: "pusheen_drinking2.jpg" },
  { first_name: "Vaeda", last_name: "Smith", nickname: "vaedasmith", email: "vaeda@example.com", password: "password", coins: 350, streak: 2, avatar: "lifting_cat3.webp" },
  { first_name: "Jeff", last_name: "Smith", nickname: "jeffsmith", email: "jeff@example.com", password: "password", coins: 750, streak: 4, avatar: "buff_garfield.jpg" },
  { first_name: "Juliette", last_name: "Smith", nickname: "juliettesmith", email: "juliette@example.com", password: "password", coins: 1000, streak: 20, avatar: "nyan_cat.png" }
])

# Create Courses
courses = Course.create!([
  { title: "Invest Like a Boss", description: "Boost your investment game and make your money work for you.", image_name: "advanced_investing.jpg" },
  { title: "Make It Rain: Finance for Today's World", description: "Get savvy with your cash and learn the essentials of personal finance.", image_name: "personal_finance_101.jpg" },
  { title: "Stock Market Starter Pack", description: "Dive into stocks and grasp the market basics.", image_name: "stock_101.jpg" }
])

# Create empty array for lessons
lessons = []

# Create Lessons for the course "Invest Like a Boss"
lessons << Lesson.create!([
  { title: "Investment 101: Your Wealth Journey Begins", content: "Get the lowdown on investing and why it's your ticket to wealth.", course: courses[0], order_rank: 1 },
  { title: "Cracking the Stock Market Code", content: "Unlock the basics of the stock market and start your investing journey.", course: courses[0], order_rank: 2 },
  { title: "Build a Winning Portfolio", content: "Learn how to build a killer investment portfolio.", course: courses[0], order_rank: 3 },
  { title: "Risk Management Like a Pro", content: "Master strategies to manage and minimize your investment risks.", course: courses[0], order_rank: 4 },
  { title: "Long-Term Investment Success", content: "Explore proven strategies for long-term investment success.", course: courses[0], order_rank: 5 }
])

# Create Lessons for the course "Make It Rain: Finance for Today's World"
lessons << Lesson.create!([
  { title: "Budgeting Like a Boss", content: "Learn how to create and stick to a budget like a financial guru.", course: courses[1], order_rank: 1 },
  { title: "Smart Saving Hacks", content: "Discover clever ways to save money and boost your savings.", course: courses[1], order_rank: 2 },
  { title: "Credit Scores Unplugged", content: "Understand credit scores and loans without the confusion.", course: courses[1], order_rank: 3 },
  { title: "Debt Busters", content: "Master techniques to manage and eliminate your debts effectively.", course: courses[1], order_rank: 4 },
  { title: "Future-Proof Your Finances", content: "Plan your financial future with confidence and savvy.", course: courses[1], order_rank: 5 }
])

# Create Lessons for the course "Stock Market Starter Pack"
lessons << Lesson.create!([
  { title: "Stock Market 101: The Basics", content: "Get the gist of how the stock market operates without the jargon.", course: courses[2], order_rank: 1 },
  { title: "Stock Types Demystified", content: "Learn about different types of stocks and what sets them apart.", course: courses[2], order_rank: 2 },
  { title: "Analyzing Stocks for Dummies", content: "Pick up the basics of stock analysis and market trends, simplified.", course: courses[2], order_rank: 3 },
  { title: "Trading vs. Investing: The Showdown", content: "Get a grip on the differences between trading and long-term investing.", course: courses[2], order_rank: 4 },
  { title: "Assembling Your Stock Portfolio", content: "Learn how to build and manage a well-rounded stock portfolio.", course: courses[2], order_rank: 5 }
])

lessons.flatten!

# Create Steps and Answers for the first lesson of course "Invest Like a Boss"
steps_and_answers = [
  {
    lesson: lessons[0],
    steps: [
      { category: :tutorial, title: "Welcome to Investing", content: "Say hello to smart money moves! Investing is all about making your money work for you. By putting your money into different assets, like stocks or bonds, you can grow your wealth over time. It's like planting a tree today and watching it bear fruit in the future.", image_name: "investment_intro.jpeg", order: 1 },
      { category: :choice, content: "Why should you invest?", order: 2, answers: [
        { content: "To avoid taxes", is_correct: false },
        { content: "To grow wealth", is_correct: true },
        { content: "To spend more", is_correct: false },
        { content: "To stay broke", is_correct: false }
      ]},
      { category: :tutorial, title: "Types of Investments", content: "From stocks to real estate, learn about different investment options. Stocks can offer high returns but come with high risks. Bonds are steadier and provide regular income. Real estate can give you rental income and long-term value appreciation. Diversification is key to balancing risks and rewards.", image_name: "investment_types.jpeg", order: 3 },
      { category: :fill, content: "Investing helps in building ______ and achieving ______", order: 4, answers: [
        { content: "wealth", is_correct: true, order: 1 },
        { content: "goals", is_correct: true, order: 2 },
        { content: "debts", is_correct: false },
        { content: "expenses", is_correct: false }
      ]},
      { category: :tutorial, title: "Summary and Next Steps", content: "Investing is your ticket to financial freedom. Start small, keep learning, and stay focused on the long game. Remember, the goal is to grow your wealth over time by making smart investment choices.", image_name: "investment_summary.png", order: 5 }
    ]
  },
  {
    lesson: lessons[1],
    steps: [
      { category: :tutorial, title: "Stock Market Basics", content: "The stock market is a platform where shares of public companies are bought and sold. It's a great way to grow your money if you understand the basics. Learn about stock exchanges, market indices, and how to evaluate stocks. The stock market can be volatile, but with knowledge, you can navigate it successfully.", order: 1 },
      { category: :choice, content: "What's a key benefit of investing in stocks?", order: 2, answers: [
        { content: "Guaranteed returns", is_correct: false },
        { content: "High growth potential", is_correct: true },
        { content: "Zero risk", is_correct: false },
        { content: "Instant wealth", is_correct: false }
      ]},
      { category: :tutorial, title: "Buying Your First Stock", content: "Buying stocks might seem intimidating, but it's quite straightforward. Open a brokerage account, research the stocks you’re interested in, and start buying. Consider starting with companies you know and believe in. Keep an eye on the stock's performance and be patient.", order: 3 },
      { category: :fill, content: "The stock market is a place where you can buy and sell ______ and ______", order: 4, answers: [
        { content: "stocks", is_correct: true, order: 1 },
        { content: "bonds", is_correct: true, order: 2 },
        { content: "groceries", is_correct: false },
        { content: "cars", is_correct: false }
      ]},
      { category: :tutorial, title: "Stock Market Tips", content: "Get practical tips for investing in the stock market: diversify your investments, stay informed about market trends, and avoid emotional trading. Consistency and patience are key. Don’t put all your money into one stock and avoid chasing after trends blindly.", order: 5 },
      { category: :tutorial, title: "Summary and Next Steps", content: "You’ve got the basics down: understand the market, buy smartly, and manage risks. Keep learning, stay patient, and don’t chase trends. You’re on your way to becoming a stock market pro!", order: 6 }
    ]
  },
  {
    lesson: lessons[2],
    steps: [
      { category: :tutorial, title: "Building a Portfolio", content: "Discover how to create a balanced and diversified investment portfolio. Diversification is like having a mix of different fruits in your basket; if one goes bad, you still have plenty left. Learn about the importance of balancing different types of investments to minimize risk.", order: 1 },
      { category: :choice, content: "Why is diversification important?", order: 2, answers: [
        { content: "Reduces risk", is_correct: true },
        { content: "Increases risk", is_correct: false },
        { content: "Guarantees profits", is_correct: false },
        { content: "Limits growth", is_correct: false }
      ]},
      { category: :tutorial, title: "Types of Assets", content: "Learn about different asset classes like stocks, bonds, and real estate. Each has its own risk and return profile, and understanding these can help you make better investment decisions.", order: 3 },
      { category: :fill, content: "A diversified portfolio includes ______ and ______", order: 4, answers: [
        { content: "stocks", is_correct: true, order: 1 },
        { content: "bonds", is_correct: true, order: 2 },
        { content: "groceries", is_correct: false },
        { content: "cars", is_correct: false }
      ]},
      { category: :tutorial, title: "Rebalancing Your Portfolio", content: "Understand the importance of rebalancing your portfolio to maintain your desired risk level. Regular rebalancing helps you stay on track with your investment goals and ensures you don't take on too much risk.", order: 5 },
      { category: :tutorial, title: "Summary and Next Steps", content: "Building and maintaining a balanced portfolio is key to long-term investment success. Keep diversifying, monitor your investments, and rebalance as needed to stay aligned with your goals.", order: 6 }
    ]
  },
  {
    lesson: lessons[3],
    steps: [
      { category: :tutorial, title: "Managing Investment Risk", content: "Learn strategies to manage and minimize the risks associated with investing. Risk management is crucial to protect your investments and ensure steady growth.", order: 1 },
      { category: :choice, content: "What's a good way to manage risk?", order: 2, answers: [
        { content: "Ignore it", is_correct: false },
        { content: "Diversify investments", is_correct: true },
        { content: "Invest all in one stock", is_correct: false },
        { content: "Avoid investing", is_correct: false }
      ]},
      { category: :tutorial, title: "Risk Assessment", content: "Assess your risk tolerance and choose investments that match your comfort level. Knowing your risk tolerance helps you make informed decisions and avoid panic during market volatility.", order: 3 },
      { category: :fill, content: "Managing risk involves ______ and ______ your investments.", order: 4, answers: [
        { content: "diversifying", is_correct: true, order: 1 },
        { content: "monitoring", is_correct: true, order: 2 },
        { content: "concentrating", is_correct: false },
        { content: "ignoring", is_correct: false }
      ]},
      { category: :tutorial, title: "Staying Informed", content: "Stay updated on market trends and news to make informed investment decisions. Being well-informed helps you anticipate market movements and adjust your strategy accordingly.", order: 5 },
      { category: :tutorial, title: "Summary and Next Steps", content: "Effective risk management involves diversifying, monitoring, and staying informed. By managing risks, you can protect your investments and achieve steady growth over time.", order: 6 }
    ]
  },
  {
    lesson: lessons[4],
    steps: [
      { category: :tutorial, title: "Winning Long-Term Strategies", content: "Explore strategies that can help you achieve long-term investment success. Long-term strategies focus on steady growth and compounding returns over time.", order: 1 },
      { category: :choice, content: "What's a key to long-term investment success?", order: 2, answers: [
        { content: "Market timing", is_correct: false },
        { content: "Patience and discipline", is_correct: true },
        { content: "Chasing trends", is_correct: false },
        { content: "Frequent trading", is_correct: false }
      ]},
      { category: :tutorial, title: "Compounding Returns", content: "Learn how compounding can significantly grow your investments over time. Compounding returns are like a snowball effect, where your earnings generate even more earnings.", order: 3 },
      { category: :fill, content: "Long-term success requires ______ and ______", order: 4, answers: [
        { content: "patience", is_correct: true, order: 1 },
        { content: "discipline", is_correct: true, order: 2 },
        { content: "luck", is_correct: false },
        { content: "timing", is_correct: false }
      ]},
      { category: :tutorial, title: "Staying the Course", content: "Stick to your long-term strategy and avoid getting swayed by short-term market fluctuations. Long-term investing requires staying the course, even during market downturns.", order: 5 },
      { category: :tutorial, title: "Summary and Next Steps", content: "Long-term investment success is built on patience, discipline, and the power of compounding. Stay committed to your strategy and keep learning to maximize your investment returns.", order: 6 }
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

# Store Items
Item.create!([
  { name: 'Buff Doge Avatar', description: 'Level up your doge game 🐶', price: 150, category: "avatar", picture_name: "buff_doge2.png" },
  { name: 'Streak Freeze', description: 'Freeze your streak! Skip a day if you want baller 😉', price: 300, category: "streak_freeze", picture_name: "streak_freeze.png" },
  { name: 'Meme Swap', description: 'Change the meme on your celebration page! 😻', price: 100, category: "meme", picture_name: "meme_swap.png" },
  { name: 'Cash Money', description: 'Make it rain dollar-dollar bills when you finish a lesson 🫰💵', price: 80, category: "background", picture_name: "cash_money.png" }
])
