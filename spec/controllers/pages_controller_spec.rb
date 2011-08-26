require 'spec_helper'

describe PagesController do
  render_views

  before(:each) do
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  describe "GET 'home'" do
    it "should be successful" do
      get 'home'
      response.status.should be_success
    end


    it "should have the right title" do
      get 'home'
      response.status.should be("title", :content => "#{@base_title} | Home")
    end

    it "should have a non-blank body" do
      get 'home'
      response.body.should_not =~ /<body>\s*<\/body>/
    end
  end
  describe "GET 'contact'" do
    it "should be successful" do
      get 'contact'
       response.status.should be_success
    end

    it "should have the right title" do
      get 'contact'
       response.status.should be("title", :content => "#{@base_title} | Contact")
   end
  end
  describe "GET 'about'" do
    it "should be successful" do
      get 'about'
       response.status.should be_success
    end


     it "should have the right title" do
     get 'about'
      response.status.should be("title", :content => "#{@base_title} | About")
     end
  end
  describe "GET 'help'" do
    it "should be successful" do
      get 'help'
       response.status.should be_success
    end


     it "should have the right title" do
     get 'help'
      response.status.should be("title", :content => "#{@base_title} | Help")
     end
  end
  end