class User < ApplicationRecord

	validates :password,    length: { minimum: 6, allow_blank: true }
  # validates :first_name,  presence: true
  # validates :last_name,   presence: true
  validates :email,   presence: true, uniqueness: true

	# def self.find_by_email(emails)
  #   return if emails.blank?

  #   emails = [emails] if emails.is_a? String
  #   emails.reject!(&:blank?)
  #   # emails = emails.map { |email| email.to_s.strip.downcase }

  #   # joins(:emails)
  #   #   .where(emails: { address: emails })
  #   #   .readonly(false)
  #   #   .first
  # end
end
