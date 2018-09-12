require 'rails_helper'

describe OxfordService do
  subject { OxfordService.new("mice") }

  it "exists" do
    expect(subject).to be_an OxfordService
  end

end
