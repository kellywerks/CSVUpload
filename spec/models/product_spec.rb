require 'spec_helper'

describe Product do
  it { should have_many :carts }
  it { should have_many :users }
end
