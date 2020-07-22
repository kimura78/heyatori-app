require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.create(:user)
  end

  it "有効なUser" do
    expect(@user).to be_valid
  end

  it "パスワードが空欄" do
    @user.password = @user.password_confirmation = " " * 6
    expect(@user).to_not be_valid
  end

  it "パスワードが短すぎる" do
    @user.password = @user.password_confirmation = "a" * 5
    expect(@user).to_not be_valid
  end

end