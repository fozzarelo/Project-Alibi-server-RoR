require 'rails_helper'

RSpec.describe "messages/show", type: :view do
  before(:each) do
    @message = assign(:message, Message.create!(
      :lat => 1.5,
      :lon => 1.5,
      :user => nil,
      :target_email => "Target Email",
      :address => "Address",
      :picture => "Picture"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(/1.5/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Target Email/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/Picture/)
  end
end
