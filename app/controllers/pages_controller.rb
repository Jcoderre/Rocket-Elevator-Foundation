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
        @batteries = Battery.all
        @columns = Column.all
        @elevators = Elevator.all

        if params[:customer].present?
            @buildings = Customer.find(params[:customer]).buildings
        else
            @buildings = Building.all
        end
        if request.xhr?
            respond_to do |format|
                format.json {
                    render json: {buldings: @buildings}
                }
            end
        end

    end
end
