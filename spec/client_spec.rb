require "spec_helper"

describe Bibliovore::Client do
  before :each do
    @client = Bibliovore::Client.new('12345')
  end

  describe "#library" do
    context "with a good id" do
      it "returns a Library object" do
        @client.conn.stub!(:get).and_return(mock Faraday::Response,
          :body => LIBRARY_RESPONSE
        )
        results = @client.library('unittestlibrary')
        results.should be_an_instance_of Bibliovore::Library
      end
    end

    context "with a bad id" do
      it "throws an error" do
        @client.conn.stub!(:get).and_return(mock Faraday::Response,
          :body => NOLIBRARY_RESPONSE
        )
        expect{@client.library('unittestlibrary')}.to raise_error(Bibliovore::ApiError)
      end
    end
  end
end