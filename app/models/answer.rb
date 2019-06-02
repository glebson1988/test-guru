class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }
  validates :body, presence: true
  validate :validate_answers_limit

  private

  def validate_answers_limit
    errors.add(:question) if question.answers.size >= 4
  end
end
