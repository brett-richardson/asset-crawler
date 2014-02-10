require 'spec_helper'


describe 'domains routing' do

  describe 'GET index' do
    specify{ expect( get: 'domains' ).to route_to(
      controller: 'domains', action: 'index'
    ) }
  end


  describe 'GET show' do
    specify{ expect( get: 'domains/1' ).to route_to(
      controller: 'domains', action: 'show', id: '1'
    ) }
  end


  describe 'POST create' do
    specify{ expect( post: 'domains' ).to route_to(
      controller: 'domains', action: 'create'
    ) }
  end

end
