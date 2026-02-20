class Blog < ApplicationRecord
  include Entryable

  default_scope { order(reviewed_at: :desc) }

  enum :status, {
    draft: 0,
    written: 1,
    reviewing: 2,
    reviewed: 3,
    published: 4
  }
end
