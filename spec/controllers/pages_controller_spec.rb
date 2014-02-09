require 'spec_helper'


describe PagesController do
  describe 'GET home' do
    before( :each ){ get :home }

    specify{ response.should be_success }
    it{ should render_template 'pages/home' }
  end
end