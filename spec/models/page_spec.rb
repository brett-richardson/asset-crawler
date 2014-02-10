require 'spec_helper'


describe Page do

  subject( :instance ){ build :page, domain: domain, path: '/test' }
  let( :domain ){ build :domain, url: 'http://google.com' }

  #= Relationships ===
  it{ should belong_to :domain      }
  it{ should have_many :links       }
  it{ should have_many :asset_links }

  it{ should have_many( :assets ).through :asset_links }
  it{ should have_many( :pages  ).through :links       }

  #= Validations ===
  it{ should validate_presence_of :domain }
  it{ should validate_uniqueness_of( :path ).scoped_to :domain_id }
  it{ should allow_value( '/rspec/testing', '/brett-richardson' ).for :path }

  it{
    should_not allow_value(
      'http://github.com', 'ftp://2.3.4.5', '//jquery.com',
      'mailto:brett.richardson.nz@gmail.com', '192.168.0.1'
    ).for :path
  }

  #= Public Methods ===
  describe '#url' do
    context "with domain of http://google.com and path of /test" do
      before do
        domain.url = 'http://google.com'
        instance.path = '/test'
      end

      its( :url ){ should eq 'http://google.com/test' }
    end
  end

end
