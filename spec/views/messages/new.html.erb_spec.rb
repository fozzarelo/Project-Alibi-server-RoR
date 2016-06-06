require 'rails_helper'

RSpec.describe "messages/new", type: :view do
  before(:each) do
    assign(:message, Message.new(
      :lat => 1.5,
      :lon => 1.5,
      :user => nil,
      :target_email => "MyString",
      :address => "MyString",
      :picture => "MyString"
    ))
  end

  it "renders new message form" do
    render

    assert_select "form[action=?][method=?]", messages_path, "post" do

      assert_select "input#message_lat[name=?]", "message[lat]"

      assert_select "input#message_lon[name=?]", "message[lon]"

      assert_select "input#message_user_id[name=?]", "message[user_id]"

      assert_select "input#message_target_email[name=?]", "message[target_email]"

      assert_select "input#message_address[name=?]", "message[address]"

      assert_select "input#message_picture[name=?]", "message[picture]"
    end
  end
end
