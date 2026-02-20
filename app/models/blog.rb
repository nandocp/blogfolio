class Blog < ApplicationRecord
  include Entryable

  default_scope { order(reviewed_at: :desc) }
end
