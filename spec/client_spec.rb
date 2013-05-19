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

    context "with gibberish" do
      it "throws the proper error" do
        @client.conn.stub!(:get).and_return(mock Faraday::Response,
          :body => GIBBERISH_RESPONSE
        )
        expect{@client.library('unittestlibrary')}.to raise_error(Bibliovore::UnrecognizableJSON)
      end
    end        
  end

  describe "#lists" do
    before :each do
      @client.conn.stub!(:get).and_return(mock Faraday::Response,
        :body => LISTS_RESPONSE
      )
      @lists = @client.lists()
    end

    it "returns an Array" do
      @lists.should be_an_instance_of Array
    end

    it "returns an Array of List objects" do
      @lists.first.should be_an_instance_of Bibliovore::List
    end
  end

  describe "#list" do
    before :each do
      @client.conn.stub!(:get).and_return(mock Faraday::Response,
        :body => LIST_RESPONSE
      )
      @list = @client.list('12345678')
    end

    it "returns a List object" do
      @list.should be_an_instance_of Bibliovore::List
    end

    it "returns the right list" do
      @list.id.should eq "138453972"
    end
  end

  describe "#user" do
    context "with a good id" do
      before :each do
        @client.conn.stub!(:get).and_return(mock Faraday::Response,
          :body => USERID_RESPONSE
        )
        @user = @client.user('unittestuser')
      end

      it "returns a User object" do
        @user.should be_an_instance_of Bibliovore::User
      end
    end

    context "with a bad id" do
      it "throws an error" do
        @client.conn.stub!(:get).and_return(mock Faraday::Response,
          :body => NOUSERID_RESPONSE
        )
        expect{@client.user('unittestuser')}.to raise_error(Bibliovore::ApiError)
      end
    end
  end

  describe "#users" do
    context "with a good id" do
      before :each do
        @client.conn.stub!(:get).and_return(mock Faraday::Response,
          :body => USER_RESPONSE
        )
        @users = @client.users('unittestuser')
      end

      it "returns an Array" do
        @users.should be_an_instance_of Array
      end

      it "returns an Array of User objects" do
        @users.first.should be_an_instance_of Bibliovore::User
      end
    end

    context "with a bad id" do
      before :each do
        @client.conn.stub!(:get).and_return(mock Faraday::Response,
          :body => NOUSER_RESPONSE
        )
        @users = @client.users('unittestuser')
      end

      it "returns an Array" do
        @users.should be_an_instance_of Array
      end

      it "returns an empty Array" do
        @users.first.should be_nil
      end
    end
  end

end