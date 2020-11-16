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
    end
end
