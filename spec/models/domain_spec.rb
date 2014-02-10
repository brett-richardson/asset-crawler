require 'spec_helper'


describe Domain do

  subject{ build :domain }
  it{ should be_valid }

  #= Validations ===
  it{ should validate_presence_of :url }
  it{ should     allow_value( 'http://www.go.com', 'https://be.in'   ).for :url }
  it{ should_not allow_value( 'ftp://test.com', 'Google', '<script>' ).for :url }

  #= Relationships ===
  it{ should have_many :pages  }
  it{ should have_many :assets }
  it{ should have_many :links  }

end
