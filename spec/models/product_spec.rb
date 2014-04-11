require 'spec_helper'

describe Product do
  it { should have_many :carts }
  it { should have_many :users }
  it { should validate_presence_of :name }
  it { should validate_numericality_of :price }
end
