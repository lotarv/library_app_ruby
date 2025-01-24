class Book < ApplicationRecord
  belongs_to :author
  belongs_to :genre
  validates :title, presence: true
  validates :year, numericality: { only_integer: true, greater_than: 0 }, allow_nil: true
  validate :unique_title_and_author

  private

  def unique_title_and_author
    if Book.exists?(title: title, author_id: author_id)
            errors.add(:author, :taken)
    end
  end
end
