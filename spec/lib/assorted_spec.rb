require "spec_helper"

RSpec.describe Assorted do
  it "includes itself in ActiveRecord::Base" do
    expect(ActiveRecord::Base.ancestors).to include(Assorted::Scopes)
  end

  describe "#options" do
    it "defaults to sort with created_at" do
      expect(Assorted.options[:default_sort_column]).to eq :created_at
    end

    it "remembers the new options given to it" do
      Assorted.options[:foo] = :bar

      expect(Assorted.options[:foo]).to eq(:bar)
    end
  end

end
