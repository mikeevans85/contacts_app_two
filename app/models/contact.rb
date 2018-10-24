class Contact < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only allows valid emails" }

  belongs_to :user
  
  def friendly_updated_at
    updated_at.strftime("%D, %I:%M")
  end

  def full_name
    return "#{name} #{middle_name} Jr."
  end
end
