class Page < ActiveRecord::Base

  include CrawlState # State machine for crawling

  #= Relationships ===
  belongs_to :domain
  has_many :links, foreign_key: :source_id
  has_many :pages, through: :links, source: :source
  has_many :asset_links, foreign_key: :source_id
  has_many :assets, through: :asset_links

  #= Validations ===
  validates_presence_of :domain
  validates_uniqueness_of :path, scope: :domain_id
  validates_format_of :path, with: Path::FORMAT, allow_nil: true,
    message: 'page path not formatted correctly'

  #= Callbacks ===
  after_save :queue_crawler, if: :queue_crawler?


  #= Calculations ===

  def url
    return domain.url unless path
    domain.url + path
  end


  #=============================================================================
    protected
  #=============================================================================


  #= Queued jobs ===

  def queue_crawler?
    new_record? or failed? or pending?
  end


  def queue_crawler
    CrawlWorker.perform_async 'Page', id
  end

end
