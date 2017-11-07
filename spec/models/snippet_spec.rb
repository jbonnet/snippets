require_relative '../spec_helper'

RSpec.describe Snippet, type: :model do
  it "is valid with a title and a body" do
    snippet = Snippet.new( title: "2017-11-07", body:  "This is today's snippet")
    expect(snippet).to be_valid
  end
  it "is valid without a title and with a body" do
    snippet = Snippet.new( title: "", body:  "This is today's snippet")
    expect(snippet).to be_valid
  end
  it "is invalid without a body" do
    snippet = Snippet.new( title: "2017-11-07", body:  "")
    expect(snippet).not_to be_valid
  end
end
