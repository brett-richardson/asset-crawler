require 'spec_helper'


describe Link do

  subject{ build :link }
  it{ should be_valid }

  #= Relationships ===
  it{ should belong_to :domain }
  it{ should belong_to :source }
  it{ should belong_to :target }

end
