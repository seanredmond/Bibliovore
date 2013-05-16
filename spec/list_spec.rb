require "spec_helper"

describe Bibliovore::List do
  before :each do
    @data = JSON.parse(LIST_RESPONSE)
    @client = Bibliovore::Client.new('12345')
    @list = Bibliovore::List.new(@data['list'], @client)
  end

  describe "#id" do
    it "returns the correct id" do
      @list.id.should eq '138453972'
    end
  end

  describe "#name" do
    it "returns the correct name" do
      @list.name.should eq 'My favourite vampire books'
    end
  end

  describe "#created" do
    it "returns the correct name" do
      @list.created.should eq '2012-11-12T20:26:39Z'
    end
  end

  describe "#updated" do
    it "returns the correct name" do
      @list.updated.should eq '2012-11-12T20:29:51Z'
    end
  end

  describe "#type" do
    before :each do
      @listtype = @list.type
    end

    it "returns an object" do
      @listtype.should be_an_instance_of OpenStruct
    end

    it "returns the correct list type id" do
      @listtype.id.should eq "TOP_10"
    end

    it "returns the correct name" do
      @listtype.name.should eq "Top 10 List"
    end
  end

  describe "#user" do
    before :each do
      @user = @list.user
    end

    it "returns a User" do
      @user.should be_an_instance_of Bibliovore::User
    end

    it "returns the correct user id" do
      @user.id.should eq "137981261"
    end
  end

  describe "#details" do
    it "returns the correct details url" do
      @list.details.should eq "http://any.bibliocommons.com/list/show/137981261/138453972"
    end
  end
end
