require 'spec_helper'


describe 'Pages routing' do
  describe 'home page' do
    specify{ expect( get '/' ).to route_to controller: 'pages', action: 'home' }
  end
end