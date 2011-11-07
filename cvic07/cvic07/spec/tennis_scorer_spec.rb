require_relative "../lib/tennis_scorer"
describe "TennisScorer", "basic scoring" do
  before(:each) do
    @ts = TennisScorer.new
  end

  it "should start with a score of 0-0" do    
    @ts.score.should == "0-0"
  end
  it "should be 15-0 if the server wins a point" do   
    @ts.win(:server)
    @ts.score.should == "15-0"
  end
  it "should be 0-15 if the receiver wins a point" do
    @ts.win(:reciever)
    @ts.score.should == "0-15"
  end
  it "should be 15-15 after they both win a point" do
    @ts.win(:server)
    @ts.win(:reciever)
    @ts.score.should == "15-15"
  end
  it "should be 30-0 after server wins 3 points" do
    @ts.win(:server)
    @ts.win(:server)
    @ts.win(:server)
    @ts.score.should == "40-0"
  end
end
