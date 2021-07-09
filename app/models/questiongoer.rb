class Questiongoer < ApplicationRecord
	has_many :answers, dependent: :destroy 
end
