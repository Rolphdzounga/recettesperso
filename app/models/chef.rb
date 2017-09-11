class Chef < ApplicationRecord
	before_save {self.email = email.downcase}
	has_many :recettes
	VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 105 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

end
