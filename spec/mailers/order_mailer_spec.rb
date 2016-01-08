require "spec_helper"

describe OrderMailer do 

  before(:each) do
    @user = User.create!(user_details)
  end  

  after(:each) do
    @user.delete
  end  

  describe "received" do
    order = Order.create!(order_details)
    order.user = @user
    let(:mail) { OrderMailer.received(order) }

    it "renders the headers" do
      mail.subject.should eq("Order confirmation")
      mail.to.should eq(["romacas@hotmail.co.uk"])
      mail.from.should eq(["admin@sadashopping.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "dispatched" do
    order = Order.create!(order_details)
    order.user = @user
    let(:mail) { OrderMailer.dispatched(order) }

    it "renders the headers" do
      mail.subject.should eq("Order dispatched")
      mail.to.should eq(["romacas@hotmail.co.uk"])
      mail.from.should eq(["admin@sadashopping.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match(" has already been dispatched")
    end
  end

end
