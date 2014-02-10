require 'spec_helper'


describe AssetLink do

  subject{ build :asset_link }
  it{ should be_valid }

  #= Relationships ===
  it{ should belong_to :domain }
  it{ should belong_to :source }
  it{ should belong_to :target }

end
