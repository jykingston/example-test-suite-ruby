require "spec_helper"

describe "Team" do
  it "has many users", quarantine: true do
    sleep(2)
    expect(2).to eq(2)
  end

  it "work together" do
    sleep(1)
    expect(2).to eq(2)
  end
end
