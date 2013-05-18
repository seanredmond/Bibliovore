require "spec_helper"

describe Bibliovore::Library do
  before :each do
    @data = JSON.parse(LIBRARY_RESPONSE)['library']
    @client = Bibliovore::Client.new('12345')
    @library = Bibliovore::Library.new(@data, @client)
  end

  describe "#id" do
    it "returns the right id" do
      @library.id.should eq "examplepl"
    end
  end

  describe "#name" do
    it "returns the right name" do
      @library.name.should eq "Example Public Library"
    end
  end

  describe "#catalog" do
    it "returns the right catalog url" do
      @library.catalog.should eq "http://examplepl.bibliocommons.com"
    end
  end

  describe "#locations" do
    before :each do
      @client.conn.stub!(:get).and_return(mock Faraday::Response,
        :body => LOCATIONS_RESPONSE
      )
      @locations = @library.locations
    end

    it "returns an Array" do
      @locations.should be_an_instance_of Array
    end

    it "returns an Array of Library Location Objects" do
      @locations.first.should be_an_instance_of Bibliovore::LibraryLocation
    end

    it "returns the right locations" do
      @locations.first.id.should eq "MA"
      @locations.first.name.should eq "Main Branch"
    end
  end
end