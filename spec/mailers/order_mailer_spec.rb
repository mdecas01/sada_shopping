require "spec_helper"

describe OrderMailer do
  describe "received" do
    order = Order.new(email: "romacas@hotmail.co.uk")
    let(:mail) { OrderMailer.received(order) }

    it "renders the headers" do
      mail.subject.should eq("Order confirmation")
      mail.to.should eq(["romacas@hotmail.co.uk"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  #describe "dispatched" do
   # let(:mail) { OrderMailer.dispatched }

    #it "renders the headers" do
     # mail.subject.should eq("Dispatched")
      #mail.to.should eq(["to@example.org"])
      #mail.from.should eq(["from@example.com"])
    #end

    #it "renders the body" do
     # mail.body.encoded.should match("Hi")
    #end
 # end

end
