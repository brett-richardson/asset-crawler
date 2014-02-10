class Asset < ActiveRecord::Base

  #= Relationships ===
  belongs_to :domain
  has_many :asset_links, foreign_key: :target_id
  has_many :pages, through: :asset_links

  #= Validations ===
  validates_presence_of :domain
  validates_format_of :path, with: Path::FORMAT

  #= Callbacks ===
  after_save :queue_crawler, if: :queue_crawler?

  #=============================================================================
    protected
  #=============================================================================

  #= Queued jobs ===

  def queue_crawler?
    new_record?
  end


  def queue_crawler
    CrawlWorker.perform_async 'Asset', id
  end

end
