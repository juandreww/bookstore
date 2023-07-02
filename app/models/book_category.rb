class BookCategory < ApplicationRecord
  validates :name, :ordering, presence: true
  enum ordering: { less_favorable: 0, standard: 1, more_favorable: 2 }
end
