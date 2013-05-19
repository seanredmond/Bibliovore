require "spec_helper"

describe Bibliovore::ListItem do
  before :each do
    @data = JSON.parse(LIST_RESPONSE)
  end

  context "with a title item" do
    before :each do
      @item = Bibliovore::ListItem.new(@data['list']['list_items'].first, @client)
    end

    describe "#type" do
      it "returns the correct type" do
        @item.type.should eq 'title'
      end
    end

    describe "#annotation" do
      it "returns the correct annotation" do
        @item.annotation.should eq 'An annotation'
      end
    end

    describe "#title" do
      before :each do
        @title = @item.title
      end

      it "returns a Title object" do
        @title.should be_an_instance_of Bibliovore::Title
      end

      it "returns the correct title" do
        @title.id.should eq '2518461073'
      end
    end

    describe "#url" do
      it "returns nothing" do
        @item.url.should be_nil
      end
    end
  end

  context "with a url item" do
    before :each do
      @item = Bibliovore::ListItem.new(@data['list']['list_items'].last, @client)
    end

    describe "#type" do
      it "returns the correct type" do
        @item.type.should eq 'url'
      end
    end

    describe "#annotation" do
      it "returns the correct annotation" do
        @item.annotation.should eq 'Check out this cool online version of Oliver Twist.'
      end
    end

    describe "#url" do
      before :each do
        @url = @item.url
      end

      describe "#title" do
        it "returns nothing" do
          @item.title.should be_nil
        end
      end

      it "returns an object" do
        @url.should be_an_instance_of OpenStruct
      end

      it "returns the correct url" do
        @url.url.should eq 'http://www.online-literature.com/dickens/olivertwist/'
      end

      it "returns the correct title" do
        @url.title.should eq 'Oliver Twist by Charles Dickens.'
      end
    end
  end
end


