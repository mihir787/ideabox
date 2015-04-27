require 'rails_helper'

RSpec.describe User, type: :model do

  let(:valid_attributes_admin) {
    {first_name: "manny", last_name: "lewis", username: "manny1", password: "password",
    password_confirmation: "password", role: 1}
  }


  it "user should be designated as an admin" do
    user = User.create(valid_attributes_admin)
    expect(user.role).to eq("admin")
  end

  it "not a valid user" do
    user = User.new(valid_attributes_admin)
    user.last_name = nil
    expect(user.first_name).not_to eq("manny")
  end


end
