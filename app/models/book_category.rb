class BookCategory < ApplicationRecord
  validates :name, :ordering, presence: true
  enum ordering: { less_favorable: 0, normal: 1, more_favorable: 2 }

  validates :name, uniqueness: :true
end
