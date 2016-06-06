require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :username => "MyString",
      :email => "MyString",
      :password_digest => "MyString",
      :has_account => false,
      :is_admin => false
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input#user_username[name=?]", "user[username]"

      assert_select "input#user_email[name=?]", "user[email]"

      assert_select "input#user_password_digest[name=?]", "user[password_digest]"

      assert_select "input#user_has_account[name=?]", "user[has_account]"

      assert_select "input#user_is_admin[name=?]", "user[is_admin]"
    end
  end
end
