require "spec_helper"

describe Bibliovore::User do
  before :each do
    @data = JSON.parse(USERID_RESPONSE)['user']
    @user = Bibliovore::User.new(@data, @client)
  end

  describe "#id" do
    it "returns the correct id" do
      @user.id.should eq "123456789"
    end
  end

  describe "#name" do
    it "returns the correct name" do
      @user.name.should eq "unittestuser"
    end
  end

  describe "#profile" do
    it "returns the correct name" do
      @user.profile.should eq "http://any.bibliocommons.com/collection/show/123456789"
    end
  end

  describe "#lists" do
    before :each do
      @user.client.conn.stub!(:get).and_return(mock Faraday::Response,
        :body => USERLISTS_RESPONSE
      )
      @lists = @user.lists
    end

    it "returns an Array" do
      @lists.should be_an_instance_of Array
    end

    it "should be an Array of List objects" do
      @lists.first.should be_an_instance_of Bibliovore::List
    end
  end
end
