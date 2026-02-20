require 'rails_helper'

RSpec.describe Blog, type: :model do
  it { should have_one(:entry).touch(true) }
  it { should define_enum_for(:status) }

  it 'Should respect :default_scope rule' do
    create_list(:blog_entry, 20)
    expect(Blog.order(reviewed_at: :desc)).to eq(Blog.all)
  end
end
