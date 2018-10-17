class Contact < ApplicationRecord
  def friendly_updated_at
    created_at.strftime("%D, %I:%M")
  end

  def full_name
    return "#{name} Jr."
  end
end
