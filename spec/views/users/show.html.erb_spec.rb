require 'rails_helper'

RSpec.describe "users/show", :type => :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :username => "Username",
      :password_digest => "Password Digest",
      :email => "Email",
      :hugger_type => "Hugger Type",
      :description => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Password Digest/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Hugger Type/)
    expect(rendered).to match(/MyText/)
  end
end
