class Blog < ApplicationRecord
  default_scope { order(reviewed_at: :desc) }
end
