require "spec_helper"

describe Bibliovore::Copy do
  before :each do
    @data = JSON.parse(COPIES_RESPONSE)
    @copy = Bibliovore::Copy.new(@data['copies'].first)
  end

  describe "#collection" do
    it "returns the right collection" do
      @copy.collection.should eq "Countee Cullen Fiction"
    end
  end

  describe "#call_number" do
    it "returns the right call number" do
      @copy.call_number.should eq "CLASSICS FIC M"
    end
  end

  describe "#library_status" do
    it "returns the right status" do
      @copy.library_status.should eq "AVAILABLE"
    end
  end

  describe "#location" do
    it "returns a Location object" do
      @copy.location.should be_an_instance_of Bibliovore::LibraryLocation
    end

    it "returns the right location" do
      @copy.location.id.should eq "52-HT"
    end
  end

  describe "#status" do
    it "returns a Status object" do
      @copy.status.should be_an_instance_of Bibliovore::Status
    end

    it "returns the right status" do
      @copy.status.id.should eq "AVAILABLE"
    end
  end
end