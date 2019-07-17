class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :questions, dependent: :destroy
  has_many :test_passages, dependent: :destroy
  has_many :users, through: :test_passages

  validates :title, presence: true,
                    uniqueness: { scope: :level }
  validates :level, :timer, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_categories, ->(category) {
    joins(:category)
      .where(categories: { title: category })
      .order(title: :desc)
  }
  scope :by_level, -> (param){ levels = { easy: 0..1,
                                          medium: 2..4,
                                          hard: 5..Float::INFINITY }
                                        where(level: levels[param.to_sym]) }

  def self.sort_categories(category)
    sort_by_categories(category).pluck(:title)
  end
end
