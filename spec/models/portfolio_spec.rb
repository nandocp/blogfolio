require 'rails_helper'

RSpec.describe Portfolio, type: :model do
  it { should have_one(:entry).touch(true) }
  it { should define_enum_for(:contract_type) }

  it 'Should respect :default_scope rule' do
    create_list(:portfolio_entry, 20)
    expect(Portfolio.order(designed_at: :desc)).to eq(Portfolio.all)
  end
end
