require 'rails_helper'

describe PagesController, type: :controller do
    context 'Get #index' do
        before do  
            get :index
        end
        it 'returns a http response' do
            expect(response).to have_http_status(:success)
        end
    end

    context 'Get #residential' do
        before do  
            get :residential
        end
        it 'returns a http response' do
            expect(response).to have_http_status(:success)
        end
    end

    context 'Get #corporate' do
        before do  
            get :corporate
        end
        it 'returns a http response' do
            expect(response).to have_http_status(:success)
        end
    end


end

