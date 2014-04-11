require 'spec_helper'

describe User do
  it { should have_many :carts }
  it { should have_many :products }
end
