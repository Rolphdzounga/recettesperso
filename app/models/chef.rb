class Chef < ApplicationRecord
	before_save {self.chefemail = chefemail.downcase}
	has_many :recettes, dependent: :destroy
	VALID_EMAIL_REGEX =  /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :chefemail, presence: {message:"l' email est obligatoire"}, length: { maximum: 105,message:"au maximum 105 caractères pour l' email"  }, 
					uniqueness: { case_sensitive: false }, 
					format: { with: VALID_EMAIL_REGEX,message:"le format du mail est incorrecte"  }
    has_secure_password
    validates :password, presence: {message:"le mot de passe est obligatoire"},length: { minimum: 5,message:"au minimum 5 caractères pour le mot de passe" }
    has_many :commentaires, dependent: :destroy
end
