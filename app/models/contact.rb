class Contact < ApplicationRecord
  def friendly_updated_at
    updated_at.strftime("%D, %I:%M")
  end

  def full_name
    return "#{name} #{middle_name} Jr."
  end
end
