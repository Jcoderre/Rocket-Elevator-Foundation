


const response = require("./streamer")

describe("A simple module", () => {
    test("it should say hello", async() => {
      expect(response()).toEqual(true);
    });
  });






// describe ElevatorMedia::Streamer do 

//     before(:all) do
//         @content = ElevatorMedia::Streamer.getContent()
//     end

//     describe "Streamer is initialized" do
//         it "Should initialize" do
//             streamer = ElevatorMedia::Streamer.new
//             expect(streamer).to be_a(ElevatorMedia::Streamer)
//         end
//     end

//     describe "getcontent" do
//         context "Check whats inside the news" do
//             it "should return a string" do
//                 expect(@content).to be_a(String)       
//             end
//             it "should end with a div tag" do 
//                 expect(@content).to end_with('</div>')  
//             end
//             it "should include p tag" do
//                 expect(@content).to include('<p>')
//             end
//             it "should include integer" do
//                 expect(@content).to include("2020")
//             end
//         end

//         context "Make it fail" do
//             it "Deliberate Failure (Text ending with a </p> instead of </div>)" do
//                 expect(@content).to_not end_with("</p>")
//             end
//         end
//     end

//     describe 'bing_news_streamer' do
        
//         it 'should have a string' do
//             http = ElevatorMedia::Streamer.bing_news_streamer()
//             expect(http).to include(String)
//         end
   
//         it "Suppose to have News section" do
//             within "Http has content" do
//                 http = ElevatorMedia::Streamer.bing_news_streamer()
//                 expect(http).to have_content('News')
//             end
//         end
//     end

// end 

