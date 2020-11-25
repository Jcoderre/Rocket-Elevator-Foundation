require 'rails_helper'
require 'elevator_media/streamer.rb'

describe ElevatorMedia::Streamer do 

    describe "Streamer is initialized" do
        it "Should initialize" do
            streamer = ElevatorMedia::Streamer.new
            expect(streamer).to be_a(ElevatorMedia::Streamer)
        end
    end

    describe "getContent" do
        it "should return a string" do
            expect(ElevatorMedia::Streamer.getContent()).to be_a(String)       
        end
        it "should begin with a div tag" do
            content = ElevatorMedia::Streamer.getContent()    
            expect(content).to end_with('</div>')  
        end
        it "should include p tag" do
            content = ElevatorMedia::Streamer.getContent()
            expect(content).to include('<p>')
        end
        it "should include integer" do
            content = ElevatorMedia::Streamer.getContent()
            expect(content).to include("2020")
        end
        it "Deliberate Failure (text ending with a </p> instead of </div>" do
            content = ElevatorMedia::Streamer.getContent()
            expect(content).to end_with("</p>")
        end
    end

    describe 'bing_news_streamer' do
        it "should have a message" do 
            response = ElevatorMedia::Streamer.bing_news_streamer()
            expect(response).to include("message")     
        end
        it 'should have a string' do
            http = ElevatorMedia::Streamer.bing_news_streamer()
            expect(http).to include(String)
        end
    end

end 

describe 
