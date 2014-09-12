require "spec_helper"

RSpec.describe Assorted do
  it "includes itself in ActiveRecord::Base" do
    expect(ActiveRecord::Base.ancestors).to include(Assorted::Scopes)
  end
end
