require "spec_helper"

describe "Flaky Spec" do
  it "should pass most times but fail at the 11th hour" do
    expect(Time.now.hour % 13).to_not eq(0)
  end
end
