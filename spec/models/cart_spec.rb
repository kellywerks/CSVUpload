require 'spec_helper'

describe Cart do
  it { should belong_to :user }
  it { should belong_to :product }
end
