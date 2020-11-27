require 'rails_helper'

describe Employee do


    describe "Employee initialize" do
        it "Should initialize" do
            create = Employee.new
            expect(create).to be_a(Employee)
        end
        describe 'Each employee are link to...' do
            context 'Many battery'  do
                it 'Should return true' do
                    link_to_battery = Building.has_many(:batteris)
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

describe User, type: :model do
    context 'validation test' do

        it "Cant create employer without admin user" do
            user = Employee.new(first_name: 'Foe', email: 'example@sample.com')
            valid = user.valid?
            error = user.errors.to_a[0]
            puts user.errors.to_a
            expect(valid).to eq(false)
            expect(error).to eq('Admin user must exist')
        end

        it 'Ensure that we can create employee when it has a admin user' do
            admin_user = AdminUser.create!(email: 'example@sample.com', password: 'test1234')
            user = Employee.new(first_name: 'Foe', email: 'example@sample.com', admin_user_id: admin_user.id)
            valid = user.valid?
            puts user.errors.to_a
            user.save!
            expect(valid).to eq(true)
            user_in_db_test = Employee.find_by(email: 'example@sample.com')
            expect(user_in_db_test).to_not be_nil
            expect(user_in_db_test).to be_a(Employee)
            expect(user_in_db_test.email).to eq('example@sample.com')
        end
    end
end

