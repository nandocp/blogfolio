class Portfolio < ApplicationRecord
  include Entryable

  enum :contract_type, %i[ freelance contract ]
end
