class PagesController < ApplicationController
    def index
        p params[:controller]
    end
    
    def residential
    end

    def corporate
    end

    def emp_interventions
        @customers = Customer.all
        @buildings = Building.all
        @batteries = Battery.all
        @columns = Column.all
        @elevators = Elevator.all
    end
end
