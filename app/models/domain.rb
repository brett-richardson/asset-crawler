class Domain < ActiveRecord::Base

  include CrawlState # State machine for crawling

  #= Relationships ===
  has_many :pages,  dependent: :destroy
  has_many :assets, dependent: :destroy
  has_many :links,  dependent: :destroy

  #= Validations ===
  validates_presence_of :url
  validates_format_of :url, with: Url::FORMAT

  #= Scopes ===
  scope :with_sub_items, ->{
    includes( :pages, :links, :assets, :asset_links )
  }

  #= Callbacks ===
  after_save :queue_crawler, if: :queue_crawler?

  #=============================================================================
    protected
  #=============================================================================

  #= Queued jobs ===

  def queue_crawler?
    new_record? or url_changed?
  end

  def queue_crawler
    begin
      CrawlWorker.perform_async 'Domain', id
    rescue Exception => e
      fail_processing
      raise e
    end
  end

end
