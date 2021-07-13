require 'rails_helper.rb'
describe UsersController, type: :controller do
 	fixtures :all


	#General
	
	#Moderator
	context "with Moderator privileges" do
		before :each do
			moderator = users(:moderator)
			sign_in moderator
		end

		#Retrieve
		it "should retrieve user banned" do
			mv = users(:banned)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:user)).to eql(mv)
		end

		it "should retrieve user" do
			mv = users(:user)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:user)).to eql(mv)
		end

		it "should retrieve moderator" do
			mv = users(:moderator)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:user)).to eql(mv)
		end

		it "should retrieve admin" do
			mv = users(:admin)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:user)).to eql(mv)
		end


		#Update
		it "should update user banned" do
			mv1 = users(:banned)
			params1 = {:id => mv1.id, :user=>{:coolness => 1}}
			get :update, :params => params1
			m_tst1 = User.find(mv1.id)
			expect(m_tst1.coolness).to eql(1)

		end

		it "should update user" do
			mv2 = users(:user)
			params2 = {:id => mv2.id, :user=>{:coolness => 0}}
			get :update, :params => params2
			m_tst2 = User.find(mv2.id)
			expect(m_tst2.coolness).to eql(0)

		end

		it "should not update moderator" do
			mv3 = users(:moderator)
			params3 = {:id => mv3.id, :user=>{:coolness => 0}}
			get :update, :params => params3
			m_tst3 = User.find(mv3.id)
			expect(m_tst3.coolness).to eql(mv3.coolness)

		end

		it "should not update admin" do
			mv3 = users(:admin)
			params3 = {:id => mv3.id, :user=>{:coolness => 0}}
			get :update, :params => params3
			m_tst3 = User.find(mv3.id)
			expect(m_tst3.coolness).to eql(mv3.coolness)

		end

		#Delete
		it "should not destroy user banned" do
			mv = users(:banned)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = User.where(:id => mv.id)
			expect(m_tst).not_to be_empty
		end

		it "should not destroy user user" do
			mv = users(:user)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = User.where(:id => mv.id)
			expect(m_tst).not_to be_empty
		end

		it "should not destroy user moderator" do
			mv = users(:moderator)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = User.where(:id => mv.id)
			expect(m_tst).not_to be_empty
		end

		it "should not destroy user admin" do
			mv = users(:moderator)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = User.where(:id => mv.id)
			expect(m_tst).not_to be_empty
		end

	end

	#Admins
	context "with Admin privileges" do
		before :each do
			admin = users(:admin)
			sign_in admin
		end
		
		#Retrieve
		it "should retrieve user banned" do
			mv = users(:banned)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:user)).to eql(mv)
		end

		it "should retrieve user" do
			mv = users(:user)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:user)).to eql(mv)
		end

		it "should retrieve moderator" do
			mv = users(:moderator)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:user)).to eql(mv)
		end

		it "should retrieve admin" do
			mv = users(:admin)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:user)).to eql(mv)
		end


		#Update
		it "should update user banned" do
			mv1 = users(:banned)
			params1 = {:id => mv1.id, :user=>{:coolness => 1}}
			get :update, :params => params1
			m_tst1 = User.find(mv1.id)
			expect(m_tst1.coolness).to eql(1)

		end

		it "should update user" do
			mv2 = users(:user)
			params2 = {:id => mv2.id, :user=>{:coolness => 0}}
			get :update, :params => params2
			m_tst2 = User.find(mv2.id)
			expect(m_tst2.coolness).to eql(0)

		end

		it "should update moderator" do
			mv3 = users(:moderator)
			params3 = {:id => mv3.id, :user=>{:coolness => 0}}
			get :update, :params => params3
			m_tst3 = User.find(mv3.id)
			expect(m_tst3.coolness).to eql(0)

		end

		it "should not update admin" do
			mv3 = users(:admin)
			params3 = {:id => mv3.id, :user=>{:coolness => 0}}
			get :update, :params => params3
			m_tst3 = User.find(mv3.id)
			expect(m_tst3.coolness).to eql(mv3.coolness)

		end



		#Delete
		it "should not destroy user banned" do
			mv = users(:banned)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = User.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

		it "should not destroy user user" do
			mv = users(:user)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = User.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

		it "should not destroy user moderator" do
			mv = users(:moderator)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = User.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

		it "should not destroy user admin" do
			mv = users(:moderator)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = User.where(:id => mv.id)
			expect(m_tst).to be_empty
		end


	end

end