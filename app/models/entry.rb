# https://www.link-assistant.com/news/seo-limits.html
# https://guides.rubyonrails.org/association_basics.html#delegated-types

class Entry < ApplicationRecord
  delegated_type :entryable, types: %w[ Blog Portfolio ], dependent: :destroy
  belongs_to :user
end
