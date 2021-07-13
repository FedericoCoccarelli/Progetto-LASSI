require 'rails_helper.rb'
describe QuestionsController, type: :controller do
 	fixtures :all


	#General
	it "should return three questions from the fixtures" do	
		adm = users(:admin)
		sign_in adm
		get :index
		expect(assigns(:questions).size).to eql(3)
	end

	#Bannned
	context "with Banned privileges" do
		before :each do
			banned = users(:banned)
			sign_in banned
		end
		#Create
		it "should not create questions" do
			params = {:question=>{:title => "Title", :author => "Author", :date => 2021-07-12}}
			get :create, :params => params
			m_tst = Question.where(:title => "Title")
			expect(m_tst).to be_empty
		end
		#Update

		it "should not update questions" do
			mv = questions(:one)
			params = {:id => mv.id, :question=>{:title => "Title"}}
			get :update, :params => params
			m_tst = Question.find(mv.id)
			expect(m_tst.title).to eql(mv.title)
		end

		#Destroy
		it "should not destroy questions" do
			mv = questions(:one)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).not_to be_empty
		end
		#Retrieve
		it "should retrieve questions" do
			mv = questions(:one)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:question)).to eql(mv)
		end




	end


	#Users
	context "with User privileges" do
		before :each do
			user = users(:user)
			sign_in user
		end
		#Create
		it "should create questions" do
			params = {:question=>{:title => "Title", :author => "Author", :date => 2021-07-12}}
			get :create, :params => params
			m_tst = Question.where(:title => "Title")
			expect(m_tst).not_to be_empty
		end
		#Retrieve
		it "should retrieve questions" do
			mv = questions(:one)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:question)).to eql(mv)
		end

		#Update

		it "should not update question 1" do
			mv1 = questions(:one)
			params1 = {:id => mv1.id, :question=>{:title => "Title"}}
			get :update, :params => params1
			m_tst1 = Question.find(mv1.id)
			expect(m_tst1.title).to eql(mv1.title)

		end

		it "should not update question 2" do
			mv2 = questions(:two)
			params2 = {:id => mv2.id, :question=>{:title => "Title"}}
			get :update, :params => params2
			m_tst2 = Question.find(mv2.id)
			expect(m_tst2.title).to eql(mv2.title)

		end

		it "should update question 3" do
			mv3 = questions(:three)
			params3 = {:id => mv3.id, :question=>{:title => "Title"}}
			get :update, :params => params3
			m_tst3 = Question.find(mv3.id)
			expect(m_tst3.title).to eql("Title")

		end

		#Destroy
		it "should not destroy question 1" do
			mv = questions(:one)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).not_to be_empty
		end

		it "should not destroy question 2" do
			mv = questions(:two)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).not_to be_empty
		end

		it "should destroy question 3" do
			mv = questions(:three)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).to be_empty
		end




	end


	#Moderator
	context "with Admin privileges" do
		before :each do
			admin = users(:moderator)
			sign_in admin
		end
		#Create
		it "should create questions" do
			params = {:question=>{:title => "Title", :author => "Author", :date => 2021-07-12}}
			get :create, :params => params
			m_tst = Question.where(:title => "Title")
			expect(m_tst).not_to be_empty
		end
		#Retrieve
		it "should retrieve questions" do
			mv = questions(:one)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:question)).to eql(mv)
		end


		#Update
		it "should not update question 1" do
			mv1 = questions(:one)
			params1 = {:id => mv1.id, :question=>{:title => "Title"}}
			get :update, :params => params1
			m_tst1 = Question.find(mv1.id)
			expect(m_tst1.title).to eql(mv1.title)

		end

		it "should update question 2" do
			mv2 = questions(:two)
			params2 = {:id => mv2.id, :question=>{:title => "Title"}}
			get :update, :params => params2
			m_tst2 = Question.find(mv2.id)
			expect(m_tst2.title).to eql("Title")

		end

		it "should not update question 3" do
			mv3 = questions(:three)
			params3 = {:id => mv3.id, :question=>{:title => "Title"}}
			get :update, :params => params3
			m_tst3 = Question.find(mv3.id)
			expect(m_tst3.title).to eql(mv3.title)

		end

		#Delete
		it "should destroy question 1" do
			mv = questions(:one)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

		it "should destroy question 2" do
			mv = questions(:two)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

		it "should destroy question 3" do
			mv = questions(:three)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

	end

	#Admins
	context "with Admin privileges" do
		before :each do
			admin = users(:admin)
			sign_in admin
		end
		#Create
		it "should create questions" do
			params = {:question=>{:title => "Title", :author => "Author", :date => 2021-07-12}}
			get :create, :params => params
			m_tst = Question.where(:title => "Title")
			expect(m_tst).not_to be_empty
		end
		#Retrieve
		it "should retrieve questions" do
			mv = questions(:one)
			params = {:id => mv.id}
			get :show, :params => params
			expect(assigns(:question)).to eql(mv)
		end


		#Update
		it "should update question 1" do
			mv1 = questions(:one)
			params1 = {:id => mv1.id, :question=>{:title => "Title"}}
			get :update, :params => params1
			m_tst1 = Question.find(mv1.id)
			expect(m_tst1.title).to eql("Title")

		end

		it "should not update question 2" do
			mv2 = questions(:two)
			params2 = {:id => mv2.id, :question=>{:title => "Title"}}
			get :update, :params => params2
			m_tst2 = Question.find(mv2.id)
			expect(m_tst2.title).to eql(mv2.title)

		end

		it "should not update question 3" do
			mv3 = questions(:three)
			params3 = {:id => mv3.id, :question=>{:title => "Title"}}
			get :update, :params => params3
			m_tst3 = Question.find(mv3.id)
			expect(m_tst3.title).to eql(mv3.title)

		end

		#Delete
		it "should destroy question 1" do
			mv = questions(:one)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

		it "should destroy question 2" do
			mv = questions(:two)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

		it "should destroy question 3" do
			mv = questions(:three)
			params = {:id => mv.id}
			get :destroy, :params => params
			m_tst = Question.where(:id => mv.id)
			expect(m_tst).to be_empty
		end

	end

end