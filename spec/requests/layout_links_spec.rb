require 'spec_helper'

describe "LayoutLinks" do
  describe "GET /layout_links" do
      it "should have a Home page at '/'" do
        # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
        get '/'
       response.status.should be('title', :key => "Home")
      end

      it "should have a Contact page at '/contact'" do
        get '/contact'
        response.status.should be('title', :content => "Contact")
      end

      it "should have a About page at '/about'" do
        get '/about'
       response.status.should be('title', :content => "About")
      end

      it "should have a Help page at '/help'" do
        get '/help'
        response.status.should be('title', :content => "Help")
      end

      it "should have a Help page at '/signup'" do
        get '/signup'
        response.status.should be('title', :content => "Sign up")
      end
  end
end