require "spec_helper"

RSpec.describe Sorted do
  it "includes itself in ActiveRecord::Base" do
    expect(ActiveRecord::Base.ancestors).to include(Sorted::Scopes)
  end
end
