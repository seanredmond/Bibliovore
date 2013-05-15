require "spec_helper"

describe Bibliovore::Title do
  before :each do
    @data = JSON.parse(TITLE_RESPONSE)
    @client = Bibliovore::Client.new('12345')
    @title = Bibliovore::Title.new(@data, @client)
  end

  describe "#id" do
    it "returns the correct id" do
      @title.id.should eq '12345678901234'
    end
  end

  describe "#title" do
    it "returns the correct title" do
      @title.title.should eq "The Book Title"
    end
  end

  describe "#subtitle" do
    it "returns the correct subtitle" do
      @title.subtitle.should eq "The Book Subtitle"
    end
  end

  describe "#details" do
    it "returns the correct details url" do
      @title.details.should eq "http://nypl.bibliocommons.com/item/show/12345678901234"
    end
  end

  describe "#authors" do
    it "returns an Array" do
      @title.authors.should be_an_instance_of Array
    end

    it "should return an Array of names" do
      @title.authors.first.name.should eq "Lastname, Firstname"
    end
  end

  describe "#isbns" do
    it "returns an Array" do
      @title.isbns.should be_an_instance_of Array
    end

    it "should return an Array of names" do
      @title.isbns.first.should eq "0987654321098"
    end
  end

  describe "#availability" do
    before :each do
      @av = @title.availability
    end

    it "returns an object" do
      @av.should be_an_instance_of OpenStruct
    end

    it "returns the correct availibility" do
      @av.name.should eq "Available to borrow"
    end

    it "returns the correct availibility id" do
      @av.id.should eq "AVAILABLE"
    end
  end

  describe "#available?" do
    it "returns true" do
      @title.available?.should be_true
    end
  end

  describe "#format" do
    before :each do
      @format = @title.format
    end

    it "returns an object" do
      @format.should be_an_instance_of OpenStruct
    end

    it "returns the correct format" do
      @format.name.should eq "Book"
    end

    it "returns the correct format id" do
      @format.id.should eq "BK"
    end
  end

  describe "#language" do
    it "is in English" do
      @title.language.should eq "English"
    end
  end

  describe "publication_date" do
    it "is 2010" do
      @title.publication_date.should eq "2010"
    end
  end
end
