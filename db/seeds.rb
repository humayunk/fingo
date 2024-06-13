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
  { first_name: "Ryan", last_name: "Smith", nickname: "ryansmith", email: "ryan@example.com", password: "password", coins: 0, streak: 0 },
  { first_name: "Humayun", last_name: "Smith", nickname: "humayunsmith", email: "humayun@example.com", password: "password", coins: 500, streak: 5 },
  { first_name: "Vaeda", last_name: "Smith", nickname: "vaedasmith", email: "vaeda@example.com", password: "password", coins: 350, streak: 2 },
  { first_name: "Jeff", last_name: "Smith", nickname: "jeffsmith", email: "jeff@example.com", password: "password", coins: 750, streak: 4 },
  { first_name: "Juliette", last_name: "Smith", nickname: "juliettesmith", email: "juliette@example.com", password: "password", coins: 1000, streak: 20 }
])

# Create Courses
courses = Course.create!([
  { title: "Personal Finance 101", description: "Learn the basics of personal finance.", image_name: "personal_finance_101.jpg" },
  { title: "Advanced Investing", description: "Take your investing skills to the next level.", image_name: "advanced_investing.jpg" },
  { title: "Stock 101", description: "Begin with stocks", image_name: "stock_101.jpg" }
])

# Create Lessons
lessons = Lesson.create!([
  { title: "Introduction to Personal Finance", content: "This is an introduction.", course: courses[0], order_rank: 1 },
  { title: "Budgeting Basics", content: "Learn how to create a budget.", course: courses[0], order_rank: 2 },
  { title: "Saving Strategies", content: "Discover effective saving strategies.", course: courses[0], order_rank: 3 },

  { title: "Stock Market Basics", content: "Learn the basics of the stock market.", course: courses[1], order_rank: 1 },
  { title: "Advanced Stock Analysis", content: "Dive deep into stock analysis techniques.", course: courses[1], order_rank: 2 },
  { title: "Investment Strategies", content: "Explore different investment strategies.", course: courses[1], order_rank: 3 },

  { title: "What is a stock?", content: "Introduction to Stocks", course: courses[2], order_rank: 1 },
  { title: "Types of Stocks", content: "Learn about different types of stocks.", course: courses[2], order_rank: 2 },
  { title: "Stock Market Mechanics", content: "Understand how the stock market works.", course: courses[2], order_rank: 3 }
])

# Create Steps and Answers for all Lessons
steps_and_answers = [
  {
    lesson: lessons[0],
    steps: [
      { category: :tutorial, title: "Introduction to Personal Finance", content: "Personal finance encompasses all the financial decisions and activities of an individual or household. It involves managing your income, expenses, savings, investments, and protecting your financial future. Personal finance includes budgeting, saving, investing, insurance, and retirement planning. Effective personal finance management helps you achieve financial stability and security.", image_name: "introduction_to_personal_finance.jpg", order: 1 },
      { category: :choice, content: "Why is personal finance important?", order: 2, answers: [
        { content: "To save money", is_correct: false },
        { content: "To manage financial resources effectively", is_correct: true },
        { content: "To get rich quickly", is_correct: false },
        { content: "To avoid all debt", is_correct: false }
      ]},
      { category: :tutorial, title: "Basics of Personal Finance Management", content: "Personal finance management involves several key steps: tracking your income and expenses, setting financial goals, creating and maintaining a budget, saving for emergencies and future needs, managing debt, and making informed decisions about investments. It’s crucial to regularly review and adjust your financial plans to stay on track.", image_name: "basics.jpg", order: 3 },
      { category: :fill, content: "Personal finance helps in managing ______ and ______.", order: 4, answers: [
        { content: "income", is_correct: true, order: 1 },
        { content: "expenses", is_correct: true, order: 2 },
        { content: "stocks", is_correct: false },
        { content: "loans", is_correct: false }
      ]},
      { category: :tutorial, title: "Why Personal Finance is Important", content: "Effective management of personal finance is important because it helps you to achieve financial independence, reduce stress, and make informed financial decisions. It ensures that you can meet your current needs, plan for the future, and cope with unexpected expenses without falling into debt.", image_name: "importance_of_finance.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[1],
    steps: [
      { category: :tutorial, title: "Understanding Budgeting", content: "Budgeting is the process of creating a plan to spend your money. This spending plan is called a budget. It allows you to determine in advance whether you will have enough money to do the things you need or want to do. Budgeting ensures that you will always have enough money for the things you need and the things that are important to you.", image_name: "budgeting.jpg", order: 1 },
      { category: :choice, content: "What are the key components of a budget?", order: 2, answers: [
        { content: "Income, expenses, savings", is_correct: true },
        { content: "Only income and expenses", is_correct: false },
        { content: "Savings and investments", is_correct: false },
        { content: "Income and loans", is_correct: false }
      ]},
      { category: :tutorial, title: "Key Components of a Budget", content: "A budget typically includes the following components: income, which is the money you receive; expenses, which are the costs you incur; savings, which is the money you set aside for future use; and investments, which are the money you allocate for wealth generation. Balancing these components effectively can help you manage your finances better.", image_name: "budget_components.jpg", order: 3 },
      { category: :fill, content: "Budgeting helps in managing ______ and achieving ______.", order: 4, answers: [
        { content: "expenses", is_correct: true, order: 1 },
        { content: "financial goals", is_correct: true, order: 2 },
        { content: "debts", is_correct: false },
        { content: "investments", is_correct: false }
      ]},
      { category: :tutorial, title: "Effective Budgeting Tips", content: "To budget effectively, you should track your spending to see where your money goes, set realistic and attainable financial goals, distinguish between needs and wants, plan for irregular expenses, and regularly review and adjust your budget. Tools like budgeting apps can help you stay on track and make the process easier.", image_name: "budget_tips.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[2],
    steps: [
      { category: :tutorial, title: "Introduction to Saving Strategies", content: "Saving strategies are plans or methods for saving money to meet your financial goals. They involve setting aside money from your income for future use, such as emergencies, large purchases, or retirement. Effective saving strategies help you build financial security and reduce the need for borrowing.", image_name: "saving_strategies.jpg", order: 1 },
      { category: :choice, content: "What is an emergency fund?", order: 2, answers: [
        { content: "A fund for long-term goals", is_correct: false },
        { content: "A fund for unforeseen emergencies", is_correct: true },
        { content: "A fund for vacations", is_correct: false },
        { content: "A fund for investments", is_correct: false }
      ]},
      { category: :tutorial, title: "Types of Saving Accounts", content: "There are different types of saving accounts that cater to various saving needs. Regular savings accounts are easy to access and manage. High-yield savings accounts offer higher interest rates but may have more restrictions. Certificates of deposit (CDs) lock your money for a set period in exchange for higher interest rates.", image_name: "saving_accounts.jpg", order: 3 },
      { category: :fill, content: "Effective saving involves setting ______ goals and ______ regularly.", order: 4, answers: [
        { content: "SMART", is_correct: true, order: 1 },
        { content: "saving", is_correct: true, order: 2 },
        { content: "investment", is_correct: false },
        { content: "budgeting", is_correct: false }
      ]},
      { category: :tutorial, title: "Benefits of Saving", content: "Saving money provides several benefits. It gives you financial security by ensuring that you have funds available for emergencies. It also allows you to plan for large purchases or investments and helps you avoid debt by having a reserve of cash. Regular saving can lead to financial independence and peace of mind.", image_name: "saving_benefits.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[3],
    steps: [
      { category: :tutorial, title: "Introduction to Stock Market", content: "The stock market is a platform where investors can buy and sell shares of publicly traded companies. It serves as a crucial component of the economy, providing companies with access to capital and investors with opportunities for profit. The stock market includes various exchanges, such as the New York Stock Exchange (NYSE) and the Nasdaq.", image_name: "stock_market_intro.jpg", order: 1 },
      { category: :choice, content: "What is a stock market?", order: 2, answers: [
        { content: "A place to buy and sell goods", is_correct: false },
        { content: "A marketplace for buying and selling securities", is_correct: true },
        { content: "A place to trade commodities", is_correct: false },
        { content: "A marketplace for currency exchange", is_correct: false }
      ]},
      { category: :tutorial, title: "How the Stock Market Works", content: "The stock market operates through exchanges where stocks are bought and sold. Prices are determined by supply and demand. Market participants include individual investors, institutional investors, and market makers who provide liquidity. Stock markets are regulated to ensure fair and transparent trading.", image_name: "stock_market_works.jpg", order: 3 },
      { category: :fill, content: "Stock trading involves ______ and ______ shares of companies.", order: 4, answers: [
        { content: "buying", is_correct: true, order: 1 },
        { content: "selling", is_correct: true, order: 2 },
        { content: "holding", is_correct: false },
        { content: "shorting", is_correct: false }
      ]},
      { category: :tutorial, title: "Basic Concepts of Stock Trading", content: "Stock trading involves buying and selling shares of companies to make a profit. Key concepts include understanding stock prices, market orders, limit orders, and stop orders. Traders also need to be aware of factors that influence stock prices, such as company performance, economic indicators, and market sentiment.", image_name: "stock_trading_basics.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[4],
    steps: [
      { category: :tutorial, title: "Advanced Stock Analysis Techniques", content: "Advanced stock analysis involves using technical and fundamental analysis to evaluate and predict stock performance. Technical analysis focuses on historical price movements and trading volumes to identify patterns and trends. Fundamental analysis examines a company's financial health, including its earnings, revenue, and growth prospects.", image_name: "stock_analysis_advanced.jpg", order: 1 },
      { category: :choice, content: "What are technical indicators?", order: 2, answers: [
        { content: "Tools for analyzing stock prices", is_correct: true },
        { content: "Methods for predicting market trends", is_correct: false },
        { content: "Strategies for long-term investment", is_correct: false },
        { content: "Techniques for managing a portfolio", is_correct: false }
      ]},
      { category: :tutorial, title: "Technical Analysis", content: "Technical analysis involves studying historical price movements and trading volumes to identify patterns and trends. Common tools include charts, moving averages, and indicators like the Relative Strength Index (RSI) and Moving Average Convergence Divergence (MACD). Technical analysis helps traders make informed decisions based on market data.", image_name: "technical_analysis.jpg", order: 3 },
      { category: :fill, content: "Technical analysis involves studying ______ and ______ to predict stock performance.", order: 4, answers: [
        { content: "price", is_correct: true, order: 1 },
        { content: "volume", is_correct: true, order: 2 },
        { content: "earnings", is_correct: false },
        { content: "revenue", is_correct: false }
      ]},
      { category: :tutorial, title: "Fundamental Analysis", content: "Fundamental analysis evaluates a stock based on the company's financial statements, management, and competitive advantages. It involves analyzing financial metrics such as revenue, earnings, and profit margins. Fundamental analysis helps investors determine the intrinsic value of a stock and make long-term investment decisions.", image_name: "fundamental_analysis.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[5],
    steps: [
      { category: :tutorial, title: "Exploring Investment Strategies", content: "Investment strategies are approaches to allocating assets to achieve financial goals. Common strategies include value investing, growth investing, dividend investing, and index investing. Each strategy has its own risk and return profile, and choosing the right one depends on an investor's goals, risk tolerance, and time horizon.", image_name: "investment_strategies.jpg", order: 1 },
      { category: :choice, content: "What is dollar-cost averaging?", order: 2, answers: [
        { content: "A strategy of investing at regular intervals", is_correct: true },
        { content: "A method of investing all at once", is_correct: false },
        { content: "A technique for short-term trading", is_correct: false },
        { content: "A process of diversifying investments", is_correct: false }
      ]},
      { category: :tutorial, title: "Value Investing", content: "Value investing focuses on buying undervalued stocks with strong fundamentals. Investors look for stocks that are trading below their intrinsic value and have potential for long-term growth. This strategy requires thorough research and patience, as it may take time for the market to recognize the stock's true value.", image_name: "value_investing.jpg", order: 3 },
      { category: :fill, content: "Investment strategies can include ______ investing and ______ investing.", order: 4, answers: [
        { content: "value", is_correct: true, order: 1 },
        { content: "growth", is_correct: true, order: 2 },
        { content: "technical", is_correct: false },
        { content: "fundamental", is_correct: false }
      ]},
      { category: :tutorial, title: "Growth Investing", content: "Growth investing targets companies with high growth potential. Investors seek out companies that are expected to grow at an above-average rate compared to other companies. Growth stocks typically reinvest their earnings into the business to fuel further expansion, rather than paying dividends to shareholders.", image_name: "growth_investing.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[6],
    steps: [
      { category: :tutorial, title: "Definition of a Stock", content: "Owning a stock means you own a piece of the company. Stocks are also known as equities. When you buy a stock, you become a shareholder, which entitles you to a portion of the company's profits and assets. Stocks are a common investment vehicle, providing opportunities for capital appreciation and dividends.", image_name: "stock_definition.jpg", order: 1 },
      { category: :choice, content: "What does a stock represent?", order: 2, answers: [
        { content: "A loan to a company", is_correct: false },
        { content: "A share in the ownership of a company", is_correct: true },
        { content: "A company's revenue", is_correct: false },
        { content: "A company's profit", is_correct: false }
      ]},
      { category: :tutorial, title: "Why Companies Issue Stocks", content: "Companies issue stocks to raise capital for growth and expansion. By selling shares to the public, companies can obtain the necessary funds without taking on debt. This capital can be used for various purposes, such as research and development, new product launches, and market expansion.", image_name: "stock_issue.jpg", order: 3 },
      { category: :fill, content: "Owning a stock entitles you to a portion of the company's ______ and ______.", order: 4, answers: [
        { content: "profits", is_correct: true, order: 1 },
        { content: "assets", is_correct: true, order: 2 },
        { content: "debts", is_correct: false },
        { content: "liabilities", is_correct: false }
      ]},
      { category: :tutorial, title: "Benefits of Owning Stocks", content: "Stocks provide opportunities for capital appreciation and dividends. Capital appreciation occurs when the value of the stock increases over time. Dividends are periodic payments made to shareholders from the company's profits. Stocks can be a key component of a diversified investment portfolio.", image_name: "stock_benefits.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[7],
    steps: [
      { category: :tutorial, title: "Common and Preferred Stocks", content: "Common stocks represent ownership in a company and entitle shareholders to voting rights and dividends. Preferred stocks, on the other hand, typically do not have voting rights but provide a fixed dividend. Preferred shareholders have a higher claim on assets and earnings than common shareholders.", image_name: "common_preferred_stocks.jpg", order: 1 },
      { category: :choice, content: "What is the difference between common and preferred stocks?", order: 2, answers: [
        { content: "Common stocks have voting rights, preferred stocks do not", is_correct: true },
        { content: "Preferred stocks have voting rights, common stocks do not", is_correct: false },
        { content: "Common stocks pay fixed dividends, preferred stocks do not", is_correct: false },
        { content: "Preferred stocks have higher risk than common stocks", is_correct: false }
      ]},
      { category: :tutorial, title: "Differences between Common and Preferred Stocks", content: "Preferred stocks typically do not have voting rights but provide a fixed dividend. Common shareholders may receive dividends, but they are not guaranteed and can fluctuate. Preferred shareholders have a higher claim on assets and earnings than common shareholders, especially in the event of liquidation.", image_name: "common_preferred_differences.jpg", order: 3 },
      { category: :fill, content: "Common stocks provide ______ rights, while preferred stocks offer fixed ______.", order: 4, answers: [
        { content: "voting", is_correct: true, order: 1 },
        { content: "dividends", is_correct: true, order: 2 },
        { content: "ownership", is_correct: false },
        { content: "returns", is_correct: false }
      ]},
      { category: :tutorial, title: "Advantages and Disadvantages of Each Type", content: "Common stocks offer potential for higher returns through capital appreciation and dividends, but they come with higher risk. Preferred stocks provide more stable dividends and have priority over common stocks in case of bankruptcy, but they generally offer lower growth potential. Investors should consider their risk tolerance and investment goals when choosing between common and preferred stocks.", image_name: "stock_advantages.jpg", order: 5 }
    ]
  },
  {
    lesson: lessons[8],
    steps: [
      { category: :tutorial, title: "Introduction to Stock Market Mechanics", content: "The stock market operates through exchanges where stocks are bought and sold. Prices are determined by supply and demand. Market participants include individual investors, institutional investors, and market makers who provide liquidity. Stock markets are regulated to ensure fair and transparent trading.", image_name: "market_mechanics.jpg", order: 1 },
      { category: :choice, content: "How do stock exchanges work?", order: 2, answers: [
        { content: "By trading through brokers", is_correct: false },
        { content: "Through stock exchanges", is_correct: true },
        { content: "By direct trading between buyers and sellers", is_correct: false },
        { content: "Through government platforms", is_correct: false }
      ]},
      { category: :tutorial, title: "Roles of Brokers and Investors", content: "Brokers act as intermediaries between buyers and sellers, facilitating trades and providing investment advice. Investors are individuals or institutions that buy and sell stocks to achieve financial goals. Understanding the roles of brokers and investors is essential for navigating the stock market.", image_name: "brokers_investors.jpg", order: 3 },
      { category: :fill, content: "Brokers facilitate trades, while investors buy and sell ______ to achieve financial ______.", order: 4, answers: [
        { content: "stocks", is_correct: true, order: 1 },
        { content: "goals", is_correct: true, order: 2 },
        { content: "bonds", is_correct: false },
        { content: "assets", is_correct: false }
      ]},
      { category: :tutorial, title: "Stock Market Regulations", content: "Stock markets are regulated to ensure fair and transparent trading. Regulatory bodies oversee the operations of exchanges, enforce compliance with securities laws, and protect investors from fraud. Understanding the regulatory framework is important for both investors and companies participating in the stock market.", image_name: "market_regulations.jpg", order: 5 }
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
items = Item.create!([
  { name: 'Streak Freeze', description: 'Freeze your streak! Skip a day if you want baller 😉', price: 150 },
  { name: "Double or Nothin' Coins", description: 'Time to make it rain even more coins! 🪙🪙🪙', price: 300 },
  { name: 'Meme Swap!', description: 'Change the meme on your celebration page! 😻', price: 100 },
  { name: 'Sticker Fun Time', description: 'Stickers are cool, SO ARE YOU!! 💖😽💅', price: 80 }
])
