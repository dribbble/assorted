require "spec_helper"

RSpec.describe Assorted::Scopes do
  it "sorts by created_at by default" do
    first = ExampleRecord.create
    second = ExampleRecord.create

    expect(ExampleRecord.asc).to eq([first, second])
    expect(ExampleRecord.desc).to eq([second, first])
  end

  it "sorts by the given column, if provided" do
    more = ExampleRecord.create(example_count: 2)
    less = ExampleRecord.create(example_count: 1)

    expect(ExampleRecord.asc(:example_count)).to eq([less, more])
    expect(ExampleRecord.desc(:example_count)).to eq([more, less])
  end

  it "prevents SQL injection attacks" do
    record = ExampleRecord.create
    injection_attempt = "created_at desc; delete * from example_records;"

    expect { ExampleRecord.asc(injection_attempt) }.to raise_exception(ActiveRecord::StatementInvalid)
    expect(ExampleRecord.count).to eq(1)
  end

  it "allows an alternate default sorting column to be supplied"
end
