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
  { first_name: "John", last_name: "Doe", nickname: "johndoe", email: "john@example.com", password: "password", coins: 100, streak: 5 },
  { first_name: "Jane", last_name: "Smith", nickname: "janesmith", email: "jane@example.com", password: "password", coins: 150, streak: 7 }
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
  { title: "Budgeting Basics", content: "Learn how to create a budget.", course: courses[0] },
  { title: "Saving Strategies", content: "Discover effective saving strategies.", course: courses[0] },

  { title: "Stock Market Basics", content: "Learn the basics of the stock market.", course: courses[1] },
  { title: "Advanced Stock Analysis", content: "Dive deep into stock analysis techniques.", course: courses[1] },
  { title: "Investment Strategies", content: "Explore different investment strategies.", course: courses[1] },

  { title: "What is a stock?", content: "Introduction to Stocks", course: courses[2] },
  { title: "Types of Stocks", content: "Learn about different types of stocks.", course: courses[2] },
  { title: "Stock Market Mechanics", content: "Understand how the stock market works.", course: courses[2] }
])

# Create Steps for Personal Finance 101
steps_pf101 = Step.create!([
  { lesson: lessons[0],
    title: "Introduction to Personal Finance",
    content: "Personal finance encompasses all the financial decisions and activities of an individual or household. It involves managing your income, expenses, savings, investments, and protecting your financial future. Personal finance includes budgeting, saving, investing, insurance, and retirement planning. Effective personal finance management helps you achieve financial stability and security.",
    is_question: false, order: 1 , image_name: "introduction_to_personal_finance.jpg" },
  { lesson: lessons[0],
    content: "Why is personal finance important?",
    is_question: true, order: 2 },
  { lesson: lessons[0],
    title: "Basics of Personal Finance Management",
    content: "Personal finance management involves several key steps: tracking your income and expenses, setting financial goals, creating and maintaining a budget, saving for emergencies and future needs, managing debt, and making informed decisions about investments. It’s crucial to regularly review and adjust your financial plans to stay on track.",
    is_question: false, order: 3, image_name: "basics.jpg" },

  { lesson: lessons[1],
    title: "Understanding Budgeting",
    content: "Budgeting is the process of creating a plan to spend your money. This spending plan is called a budget. It allows you to determine in advance whether you will have enough money to do the things you need or want to do. Budgeting ensures that you will always have enough money for the things you need and the things that are important to you.",
    is_question: false, order: 1, image_name: "introduction_to_personal_finance.jpg" },
  { lesson: lessons[1],
    content: "What are the key components of a budget?",
    is_question: true, order: 2 },
  { lesson: lessons[1],
    title: "Tips for Effective Budgeting",
    content: "Effective budgeting involves: tracking your spending to see where your money goes, setting realistic and attainable financial goals, distinguishing between needs and wants, planning for irregular expenses, and regularly reviewing and adjusting your budget. Tools like budgeting apps can help you stay on track.",
    is_question: false, order: 3, image_name: "introduction_to_personal_finance.jpg" },

  { lesson: lessons[2],
    title: "Introduction to Saving Strategies",
    content: "Saving strategies are plans or methods for saving money to meet your financial goals. They involve setting aside money from your income for future use, such as emergencies, large purchases, or retirement. Effective saving strategies help you build financial security and reduce the need for borrowing.",
    is_question: false, order: 1, image_name: "introduction_to_personal_finance.jpg" },
  { lesson: lessons[2],
    content: "What is an emergency fund?",
    is_question: true, order: 2 },
  { lesson: lessons[2],
    title: "Effective Saving Tips",
    content: "To save effectively, start by setting specific, measurable, achievable, relevant, and time-bound (SMART) goals. Automate your savings by setting up automatic transfers to your savings account. Cut unnecessary expenses, take advantage of saving opportunities like discounts and sales, and regularly review and adjust your saving strategies.",
    is_question: false, order: 3, image_name: "introduction_to_personal_finance.jpg" }
])

# Create Steps for Advanced Investing
steps_ai = Step.create!([
  { lesson: lessons[3],
    title: "Introduction to Stock Market",
    content: "The stock market is a platform where investors can buy and sell shares of publicly traded companies. It serves as a crucial component of the economy, providing companies with access to capital and investors with opportunities for profit. The stock market includes various exchanges, such as the New York Stock Exchange (NYSE) and the Nasdaq.",
    is_question: false, order: 1, image_name: "introduction_to_personal_finance.jpg" },
  { lesson: lessons[3],
    content: "What is a stock market?",
    is_question: true, order: 2 },
  { lesson: lessons[3],
    title: "Basic Concepts of Stock Trading",
    content: "Stock trading involves buying and selling shares of companies to make a profit. Key concepts include understanding stock prices, market orders, limit orders, and stop orders. Traders also need to be aware of factors that influence stock prices, such as company performance, economic indicators, and market sentiment.",
    is_question: false, order: 3, image_name: "introduction_to_personal_finance.jpg" },

  { lesson: lessons[4],
    title: "Advanced Stock Analysis Techniques",
    content: "Advanced stock analysis involves using technical and fundamental analysis to evaluate and predict stock performance. Technical analysis focuses on historical price movements and trading volumes to identify patterns and trends. Fundamental analysis examines a company's financial health, including its earnings, revenue, and growth prospects.",
    is_question: false, order: 1, image_name: "introduction_to_personal_finance.jpg" },
  { lesson: lessons[4],
    content: "What are technical indicators?",
    is_question: true, order: 2 },
  { lesson: lessons[4],
    title: "Fundamental Analysis vs. Technical Analysis",
    content: "Fundamental analysis evaluates a stock based on the company's financial statements, management, and competitive advantages. Technical analysis, on the other hand, studies past market data, primarily price and volume, to forecast future price movements. Both methods have their strengths and can be used together for comprehensive stock analysis.",
    is_question: false, order: 3, image_name: "introduction_to_personal_finance.jpg" },

  { lesson: lessons[5],
    title: "Exploring Investment Strategies",
    content: "Investment strategies are approaches to allocating assets to achieve financial goals. Common strategies include value investing, growth investing, dividend investing, and index investing. Each strategy has its own risk and return profile, and choosing the right one depends on an investor's goals, risk tolerance, and time horizon.",
    is_question: false, order: 1, image_name: "introduction_to_personal_finance.jpg" },
  { lesson: lessons[5],
    content: "What is dollar-cost averaging?",
    is_question: true, order: 2 },
  { lesson: lessons[5],
    title: "Different Types of Investment Strategies",
    content: "Value investing focuses on buying undervalued stocks with strong fundamentals. Growth investing targets companies with high growth potential. Dividend investing seeks stocks that provide regular income through dividends. Index investing involves buying a diversified portfolio of stocks that mirror a market index, such as the S&P 500.",
    is_question: false, order: 3, image_name: "introduction_to_personal_finance.jpg" }
])

# Create Steps for Stock 101
steps_stock101 = Step.create!([
  { lesson: lessons[6],
    title: "Definition of a Stock",
    content: "Owning a stock means you own a piece of the company. Stocks are also known as equities. When you buy a stock, you become a shareholder, which entitles you to a portion of the company's profits and assets. Stocks are a common investment vehicle, providing opportunities for capital appreciation and dividends.",
    is_question: false, order: 1, image_name: "introduction_to_personal_finance.jpg" },
  { lesson: lessons[6],
    content: "What does a stock represent?",
    is_question: true, order: 2 },
  { lesson: lessons[6],
    title: "Why Companies Issue Stocks",
    content: "Companies issue stocks to raise capital for growth and expansion. By selling shares to the public, companies can obtain the necessary funds without taking on debt. This capital can be used for various purposes, such as research and development, new product launches, and market expansion.",
    is_question: false, order: 3, image_name: "introduction_to_personal_finance.jpg" },

  { lesson: lessons[7],
    title: "Common and Preferred Stocks",
    content: "Common stocks represent ownership in a company and entitle shareholders to voting rights and dividends. Preferred stocks, on the other hand, typically do not have voting rights but provide a fixed dividend. Preferred shareholders have a higher claim on assets and earnings than common shareholders.",
    is_question: false, order: 1, image_name: "introduction_to_personal_finance.jpg" },
  { lesson: lessons[7],
    content: "What is the difference between common and preferred stocks?",
    is_question: true, order: 2 },
  { lesson: lessons[7],
    title: "Advantages and Disadvantages of Each Type",
    content: "Common stocks offer potential for higher returns through capital appreciation and dividends, but they come with higher risk. Preferred stocks provide more stable dividends and have priority over common stocks in case of bankruptcy, but they generally offer lower growth potential.",
    is_question: false, order: 3, image_name: "introduction_to_personal_finance.jpg" },

  { lesson: lessons[8],
    title: "Introduction to Stock Market Mechanics",
    content: "The stock market operates through exchanges where stocks are bought and sold. Prices are determined by supply and demand. Market participants include individual investors, institutional investors, and market makers who provide liquidity. Stock markets are regulated to ensure fair and transparent trading.",
    is_question: false, order: 1, image_name: "introduction_to_personal_finance.jpg" },
  { lesson: lessons[8],
    content: "How do stock exchanges work?",
    is_question: true, order: 2 },
  { lesson: lessons[8],
    title: "Roles of Brokers and Investors",
    content: "Brokers act as intermediaries between buyers and sellers, facilitating trades and providing investment advice. Investors are individuals or institutions that buy and sell stocks to achieve financial goals. Understanding the roles of brokers and investors is essential for navigating the stock market.",
    is_question: false, order: 3, image_name: "introduction_to_personal_finance.jpg" }
])

# Create Answers for Personal Finance 101
answers_pf101 = Answer.create!([
  { step: steps_pf101[1], content: "A) To save money", is_correct: false },
  { step: steps_pf101[1], content: "B) To manage financial resources effectively", is_correct: true },
  { step: steps_pf101[4], content: "A) Income, expenses, savings", is_correct: true },
  { step: steps_pf101[4], content: "B) Only income and expenses", is_correct: false },
  { step: steps_pf101[7], content: "A) A fund for long-term goals", is_correct: false },
  { step: steps_pf101[7], content: "B) A fund for unforeseen emergencies", is_correct: true }
])

# Create Answers for Advanced Investing
answers_ai = Answer.create!([
  { step: steps_ai[1], content: "A) A place to buy and sell goods", is_correct: false },
  { step: steps_ai[1], content: "B) A marketplace for buying and selling securities", is_correct: true },
  { step: steps_ai[4], content: "A) Tools for analyzing stock prices", is_correct: true },
  { step: steps_ai[4], content: "B) Methods for predicting market trends", is_correct: false },
  { step: steps_ai[7], content: "A) A strategy of investing at regular intervals", is_correct: true },
  { step: steps_ai[7], content: "B) A method of investing all at once", is_correct: false }
])

# Create Answers for Stock 101
answers_stock101 = Answer.create!([
  { step: steps_stock101[1], content: "A) A loan to a company", is_correct: false },
  { step: steps_stock101[1], content: "B) A share in the ownership of a company", is_correct: true },
  { step: steps_stock101[4], content: "A) Common stocks have voting rights, preferred stocks do not", is_correct: true },
  { step: steps_stock101[4], content: "B) Preferred stocks have voting rights, common stocks do not", is_correct: false },
  { step: steps_stock101[7], content: "A) By trading through brokers", is_correct: false },
  { step: steps_stock101[7], content: "B) Through stock exchanges", is_correct: true }
])

# Create Enrollments
enrollments = Enrollment.create!([
  { user: users[0], course: courses[0], completed: false, enrollment_date: DateTime.now },
  { user: users[1], course: courses[1], completed: false, enrollment_date: DateTime.now },
  { user: users[0], course: courses[2], completed: false, enrollment_date: DateTime.now },
  { user: users[1], course: courses[0], completed: false, enrollment_date: DateTime.now },
  { user: users[1], course: courses[2], completed: false, enrollment_date: DateTime.now }
])

# Create User Progresses
user_progresses = UserProgress.create!([
  { user: users[0], lesson: lessons[0], completed: false, score: 50, current_step: 1 },
  { user: users[1], lesson: lessons[1], completed: false, score: 75, current_step: 2 },
  { user: users[0], lesson: lessons[2], completed: false, score: 50, current_step: 1 },
  { user: users[1], lesson: lessons[3], completed: false, score: 75, current_step: 2 },
  { user: users[0], lesson: lessons[4], completed: false, score: 50, current_step: 1 },
  { user: users[1], lesson: lessons[5], completed: false, score: 75, current_step: 2 },
  { user: users[0], lesson: lessons[6], completed: false, score: 50, current_step: 1 },
  { user: users[1], lesson: lessons[7], completed: false, score: 75, current_step: 2 },
  { user: users[0], lesson: lessons[8], completed: false, score: 50, current_step: 1 }
])
