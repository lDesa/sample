require 'rails_helper'


describe Relationship do

  let(:follower) { FactoryGirl.create(:user) }
  let(:followed) { FactoryGirl.create(:user) }
  let(:relationship) { follower.relationships.build(followed_id: followed.id) }

  subject { relationship }

  it { should be_valid }


  describe "follower methods" do
    it { should respond_to(:follower) }
    it { should respond_to(:followed) }

    it { expect(follower).to eq follower  }
    it { expect(followed).to eq followed  }

  end

  describe "when followed id is not present" do
    before { relationship.followed_id = nil }
    it { should_not be_valid }
  end

  describe "when follower id is not present" do
    before { relationship.follower_id = nil }
    it { should_not be_valid }
  end
end

# describe RelationshipsController do

#   let(:user) { FactoryGirl.create(:user) }
#   let(:other_user) { FactoryGirl.create(:user) }

#   before { sign_in user, no_capybara: true }

#   describe "creating a relationship with Ajax" do

#     it "should increment the Relationship count" do
#       expect do
#         xhr :post, :create, relationship: { followed_id: other_user.id }
#       end.to change(Relationship, :count).by(1)
#     end

#     it "should respond with success" do
#       xhr :post, :create, relationship: { followed_id: other_user.id }
#       expect(response).to be_success
#     end
#   end

#   describe "destroying a relationship with Ajax" do

#     before { user.follow!(other_user) }
#     let(:relationship) { user.relationships.find_by(followed_id: other_user) }

#     it "should decrement the Relationship count" do
#       expect do
#         xhr :delete, :destroy, id: relationship.id
#       end.to change(Relationship, :count).by(-1)
#     end

#     it "should respond with success" do
#       xhr :delete, :destroy, id: relationship.id
#       expect(response).to be_success
#     end
#   end
# end