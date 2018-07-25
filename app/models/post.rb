class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbait?

  def clickbait?
    titles = ["Won't Believe", "Secret", "Top", "Guess"]
    if self.title
      if !titles.any? {|clickbait| self.title.include?(clickbait)}
        errors.add(:title, "not sufficient click-bait")
      end
    end
  end

end
