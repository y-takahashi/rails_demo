require 'rails_helper'

RSpec.describe "tickets/edit", :type => :view do
  before(:each) do
    @ticket = assign(:ticket, Ticket.create!(
      :title => "MyString",
      :body => "MyText",
      :finished => false
    ))
  end

  it "renders the edit ticket form" do
    render

    assert_select "form[action=?][method=?]", ticket_path(@ticket), "post" do

      assert_select "input#ticket_title[name=?]", "ticket[title]"

      assert_select "textarea#ticket_body[name=?]", "ticket[body]"

      assert_select "input#ticket_finished[name=?]", "ticket[finished]"
    end
  end
end
