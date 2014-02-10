class DomainsController < InheritedResources::Base

  has_scope :with_sub_items, only: :show


  def create
    super{ domains_path }
  end


  def show
  end


  #=============================================================================
    protected
  #=============================================================================


  def permitted_params
    params.permit domain: [ :url ]
  end

end
