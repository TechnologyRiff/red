#require 'rails_helper'

describe Vote do
	describe "validations" do
		describe "value validation" do
			it "only allows -1 or 1 as values" do
				#your expectations here
			end
		end
	end
end

# 		before do
# 			@post = Post.create(title: 'post title', body: 'post body')
# 			3.times { @post.votes.create(value: 1) }
# 			2.times { @post.votes.create(value: -1) }
# 		end

# 		describe '#up_votes' do
# 			it "counts the number of votes with value = 1" do
# 				expect( @post.up_votes ).to eq(3)
# 			end
# 		end

# 		describe '#down_votes' do
# 			it "counts the number of votes with value =-1" do
# 				expect( @post.down_votes ).to eq(2)
# 			end
# 		end

# 		describe '#points' do
# 			it "returns the sum of all down and up votes" do 
# 				expect( @posts.points ).to eq(1) #3 -2
# 			end
# 		end
# 	end
# end

	
# end