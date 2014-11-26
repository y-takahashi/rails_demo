require 'rails_helper'

RSpec.describe "users/edit", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :nickname => "MyString",
      :password_digest => "MyString",
      :first_name => "MyString",
      :last_name => "MyString"
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

      assert_select "input#user_nickname[name=?]", "user[nickname]"

      assert_select "input#user_password_digest[name=?]", "user[password_digest]"

      assert_select "input#user_first_name[name=?]", "user[first_name]"

      assert_select "input#user_last_name[name=?]", "user[last_name]"
    end
  end
end
