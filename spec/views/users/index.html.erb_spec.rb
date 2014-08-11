require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :email => "Email",
        :hugger_type => "Hugger Type",
        :description => "MyText"
      ),
      User.create!(
        :username => "Username",
        :password_digest => "Password Digest",
        :email => "Email",
        :hugger_type => "Hugger Type",
        :description => "MyText"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Password Digest".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Hugger Type".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
