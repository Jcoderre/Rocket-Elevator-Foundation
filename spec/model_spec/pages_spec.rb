require 'rails_helper'

describe PagesController, type: :controller do
    context 'Get #index' do
        it 'returns a success response' do
            get :index
            expect(response).to be_successful
        end

    end

    context 'Get #residential' do
        it 'returns a success response' do
            get :residential
            expect(response).to be_successful
        end
    end

    context 'Get #corporate' do
        it 'returns a success response' do
            get :corporate
            expect(response).to be_successful
        end
    end

end