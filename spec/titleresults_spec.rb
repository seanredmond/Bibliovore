require "spec_helper"

describe Bibliovore::TitleResults do
  before :each do
    @data = JSON.parse(TITLES_RESPONSE)
    @client = Bibliovore::Client.new('12345')
    @titles = Bibliovore::TitleResults.new(@data, @client)
  end

  describe "#count" do
    it "returns the right count" do
      @titles.count.should eq 412
    end
  end

  describe "#limit" do
    it "returns the right limit" do
      @titles.limit.should eq 10
    end
  end

  describe "#page" do
    it "returns the right page" do
      @titles.page.should eq 1
    end
  end

  describe "#pages" do
    it "returns the right number of pages" do
      @titles.pages.should eq 42
    end
  end

  describe "#titles" do
    it "returns an Array" do
      @titles.titles.should be_an_instance_of Array
    end

    it "returns an Array of Title objects" do
      @titles.titles.first.should be_an_instance_of Bibliovore::Title
    end

    it "returns the right titles" do
      @titles.titles.first.title.should eq "Moby-Dick"
    end
  end
end
