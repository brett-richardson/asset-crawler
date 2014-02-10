require 'spec_helper'


describe PageCrawler do

  subject( :instance ){ described_class.new }
  let( :page ){ create :page }


  its( :crawl_class ){ should eq Page }


  describe '#crawl' do specify{
    expect( ->{
      instance.crawl page.id
    } ).to change( Page, :count )
  } end

end
