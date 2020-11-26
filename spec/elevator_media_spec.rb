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
        context "Check whats inside the news" do
            it "should return a string" do
                expect(ElevatorMedia::Streamer.getContent()).to be_a(String)       
            end
            it "should end with a div tag" do
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
        end
        context "Make it fail" do
            it "Deliberate Failure (Text ending with a </p> instead of </div>)" do
                content = ElevatorMedia::Streamer.getContent()
                expect(content).to end_with("</p>")
            end
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

describe Employee do
    describe "Employee initialize" do
        it "Should initialize" do
            create = Employee.new
            expect(create).to be_a(Employee)
        end
        describe 'Each employee are link to...' do
            context 'Many battery'  do
                it 'Should return true' do
                    link_to_battery = Building.has_many(:batteries)
                    expect(link_to_battery).to be_truthy
                end
            end
            context 'Many Customers'  do
                it 'Should return true' do
                    link_to_customer = Building.has_many(:customers)
                    expect(link_to_customer).to be_truthy
                end
            end
            context 'Admin user'  do
                it 'Should return true' do
                    admin_belonging = Building.belongs_to(:admin_user)
                    expect(admin_belonging).to be_truthy
                end
            end
        end    
    end
end

describe QuotesController, type: :model do
    describe "Quote initialize" do
        it "Quote Should initialize" do
            create = Quote.new
            expect(create).to be_a(Quote)
        end

        # describe "index" do
        #     it "Should index" do
        #         info_quote = Quote.last.index
        #         expect(info_quote).to be_an(Array)
        #     end
        # end
    end
end

describe Building do
    describe "Building initialize" do
        it "Should initialize" do
            create = Building.new
            expect(create).to be_a(Building)
        end

        describe "Building list is empty" do
            it "Should return nil" do
                response = Building.last
                expect(response).to be_nil
            end
        end

        describe 'Each building have ...' do
            context 'One building detail'  do
                it 'Should return true' do
                    building_info = Building.has_one(:building_detail)
                    expect(building_info).to be_truthy
                end
            end
            context 'Many batteries'  do
                it 'Should return true' do
                    link_to_battery = Building.has_many(:batteries)
                    expect(link_to_battery).to be_truthy
                end
            end
            context 'Customer'  do
                it 'Should return true' do
                    link_to_customers = Building.belongs_to(:customer)
                    expect(link_to_customers).to be_truthy
                end
            end
            context 'Address'  do
                it 'Should return true' do
                    link_to_address = Building.belongs_to(:address)
                    expect(link_to_address).to be_truthy
                end
            end
        end
    end
end

describe User, type: :model do
    context 'validation test' do
        it 'Ensure first name presence' do
            user = Employee.new(first_name: 'Foe', email: 'example@sample.com').save
            expect(user).to eq(false)
        end
        it 'Ensure last name presence' do
            user = Employee.new(last_name: 'Doe', email: 'example@sample.com').save
            expect(user).to eq(false)
        end
        it 'Ensure email presence' do
            user = Employee.new(first_name: 'Foe', last_name: 'Doe').save
            expect(user).to eq(false)
        end
        it 'Should save succesfully' do
            user = Employee.new(first_name: 'Foe', last_name: 'Doe', email: 'example@sample.com').save
            expect(user).to eq(true)
        end
    end
end
