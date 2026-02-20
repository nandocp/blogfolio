class Portfolio < ApplicationRecord
  include Entryable

  default_scope { order(designed_at: :desc) }

  enum :contract_type, %i[ freelance contract ]
end
