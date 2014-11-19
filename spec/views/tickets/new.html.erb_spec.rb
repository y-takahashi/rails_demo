require 'rails_helper'

RSpec.describe "tickets/new", :type => :view do
  before(:each) do
    assign(:ticket, Ticket.new(
      :title => "MyString",
      :body => "MyText",
      :finished => false
    ))
  end

  it "renders new ticket form" do
    render

    assert_select "form[action=?][method=?]", tickets_path, "post" do

      assert_select "input#ticket_title[name=?]", "ticket[title]"

      assert_select "textarea#ticket_body[name=?]", "ticket[body]"

      assert_select "input#ticket_finished[name=?]", "ticket[finished]"
    end
  end
end
