require 'rails_helper'

RSpec.describe "messages/index", type: :view do
  before(:each) do
    assign(:messages, [
      Message.create!(
        :lat => 1.5,
        :lon => 1.5,
        :user => nil,
        :target_email => "Target Email",
        :address => "Address",
        :picture => "Picture"
      ),
      Message.create!(
        :lat => 1.5,
        :lon => 1.5,
        :user => nil,
        :target_email => "Target Email",
        :address => "Address",
        :picture => "Picture"
      )
    ])
  end

  it "renders a list of messages" do
    render
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Target Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
  end
end
