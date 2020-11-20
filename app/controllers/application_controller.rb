class ApplicationController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def access_denied(exception)
        redirect_to index_path, alert: exception.message
    end
end
