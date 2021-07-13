require "rails_helper"

require "./app/models/movie.rb"
describe Movie do
	fixtures :all

	context "A movie with no reviews" do

		it "has average score equal -1" do
			mv = movies(:three)
			expect(mv.averageScore()).to eql(-1)
		end
	end

	context "A movie with one review with Score 10" do
		it "has 1 review" do
			mv = movies(:one)
			expect(mv.reviews.count).to eql(1)
		end
		it "has average score equal 10" do
			mv = movies(:one)
			expect(mv.averageScore()).to eql(10.0)
		end
	end

	context "A movie with two reviews with Scores 10 and 5" do
		it "has 2 review" do
			mv = movies(:two)
			expect(mv.reviews.count).to eql(2)
		end
		it "has average score equal 7.5" do
			mv = movies(:two)
			expect(mv.averageScore()).to eql(7.5)
		end
	end


end