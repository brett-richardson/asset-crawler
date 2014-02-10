require 'spec_helper'


describe DomainsController do

  let( :attrs  ){ attributes_for :domain }
  let( :domain ){ create :domain         }


  describe 'POST create' do
    let( :request ){ post :create, domain: attrs }

    specify{ request and response.should redirect_to domains_path }
  end


  describe 'GET index' do
    let( :request ){ get :index }

    specify{ request and response.should be_success }
  end


  describe 'GET show' do
    let( :request ){ get :show, id: domain.id }

    specify{ request and response.should be_success }
  end


  describe 'GET new' do
    let( :request ){ get :new }

    specify{ request and response.should be_success }
  end

end
