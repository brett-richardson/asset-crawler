require 'spec_helper'


describe Asset do

  subject{ build :asset }
  it{ should be_valid }

  #= Relationships ===
  it{ should belong_to :domain }
  it{ should have_many :asset_links }
  it{ should have_many( :pages ).through :asset_links }

end
