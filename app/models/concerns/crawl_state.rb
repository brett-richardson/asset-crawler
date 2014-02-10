module CrawlState

  extend ActiveSupport::Concern


  included do
    state_machine :state, initial: :pending do
      state :processing
      state :complete
      state :failed

      event( :begin_processing    ){ transition pending:    :processing }
      event( :complete_processing ){ transition processing: :complete   }
      event( :fail_processing     ){ transition [ :processing, :pending ] => :failed  }
      event( :reprocess           ){ transition [ :complete,   :failed  ] => :pending }
    end
  end

end
