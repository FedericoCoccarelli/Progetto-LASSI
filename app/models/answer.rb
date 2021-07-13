class Answer < ApplicationRecord
	scope :filter_by_author, -> (author) {where author: author}
	belongs_to :question

end
