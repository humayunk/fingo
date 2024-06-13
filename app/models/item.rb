class Item < ApplicationRecord
  enum category: {
    unknown: 0,
    avatar: 1,
    meme: 2,
    streak_freeze: 3,
    background: 4
  }, _default: :unknown
end
