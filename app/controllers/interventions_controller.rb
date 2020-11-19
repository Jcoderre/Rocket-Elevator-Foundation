class InterventionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

    def create 
      @intervention = Intervention.new(intervention_params)
      @intervention.save!

      respond_to do |format|
        
      if @intervention.save 

                  # Send support ticket (Zendesk API)
          client = ZendeskAPI::Client.new do |config|
          
              # Mandatory:
      
              config.url = "https://codeboxxjc.zendesk.com/api/v2" # e.g. https://mydesk.zendesk.com/api/v2
          
              # Basic / Token Authentication
              config.username = "jcoderre@outlook.fr/token"
          
              # Choose one of the following depending on your authentication choice
              config.token = ENV['zendesk_key']
              # config.password = "your zendesk password"
          
              # OAuth Authentication
              # config.access_token = "your OAuth access token"
          
              # Optional:
          
              # Retry uses middleware to notify the user
              # when hitting the rate limit, sleep automatically,
              # then retry the request.
              config.retry = true
          
              # Raise error when hitting the rate limit.
              # This is ignored and always set to false when `retry` is enabled.
              # Disabled by default.
              config.raise_error_when_rate_limited = false
          
              # Logger prints to STDERR by default, to e.g. print to stdout:
              require 'logger'
              config.logger = Logger.new(STDOUT)
          
              # Changes Faraday adapter
              # config.adapter = :patron
          
              # Merged with the default client options hash
              # config.client_options = {:ssl => {:verify => false}, :request => {:timeout => 30}}
          
              # When getting the error 'hostname does not match the server certificate'
              # use the API at https://yoursubdomain.zendesk.com/api/v2
          end
      
          ZendeskAPI::Ticket.create!(client, :subject => "Intervention from #{@intervention.employee_id}", :comment => { :value => """ 
              
              Intervention # #{@intervention.id}

              \nAn intervention has just been created.

              \nThis intervention take place with the company ID # #{@intervention.customer_id}. 
              
              \nReferences : 

              \nBuilding ID : # #{@intervention.building_id}.

              \nBattery ID : # #{@intervention.battery_id}.

              \nColumn ID : # #{@intervention.column_id}.

              \nElevator ID : # #{@intervention.elevator_id}.

              \nThe employee # #{@intervention.employee_id} is assigned to the task.

              \nDescription of the task : #{@intervention.description}
              
              """}, :submitter_id => client.current_user.id, :priority => "high"
          )


          format.html { redirect_to root_path, notice: "Intervention form completed!" }
          format.json { render json: @intervention, status: :created, location: @intervention }
        else
            format.html { 
                flash.now[:notice]="Save proccess coudn't be completed!" 
                render :new 
            }
            format.json { render json: @intervention.errors, status: :unprocessable_entity}
        end
      end
    end
      
  private

    def intervention_params
      params.require(:intervention).permit(:intervention_start, :intervention_stop, :result, :report, :status, :elevator_id, :author, :customer_id, :building_id, :battery_id, :column_id, :employee_id, :company_name, :description)
    end


end
