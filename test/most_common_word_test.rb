require 'minitest/autorun'
require 'minitest/reporters'
require_relative "../lib/most_common_word"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "most common word" do
  it "will return nil for an empty string" do 
    answer = most_common_word("", [])

    expect(answer).must_be_nil
  end

  it "will return nil if all words are banned" do 
    answer = most_common_word("I like toast", ["I", "like", "toast"])

    expect(answer).must_be_nil
  end

  it "will return the word if it's the only one and it's not banned" do
    answer = most_common_word("I", [])

    expect(answer).must_equal "I"
  end

  it "will return the 1st word if the words are tied" do
    answer = most_common_word("I like I like ike", [])

    expect(answer).must_equal "I"
  end


  it "will return the most common word that is not banned" do
    answer = most_common_word("I like I like ike", ["I"])

    expect(answer).must_equal "like"
  end

  it "will return the most common word that is not banned" do
    answer = most_common_word("I like I like ike", ["I", "like"])

    expect(answer).must_equal "ike"
  end
end