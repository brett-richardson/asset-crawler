require 'spec_helper'


describe 'Visiting the home page' do
  specify do
    visit '/'

    page.should have_selector 'h1', text: 'Asset Crawler'
    page.should have_selector 'form'
    page.should have_selector 'form input#domain_url'
    page.should have_selector 'form input[type=submit]'
  end
end
