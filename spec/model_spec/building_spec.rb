require 'rails_helper'



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

    end
end


