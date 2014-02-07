require 'spec_helper'

describe "StaticPages" do
  
	subject { page }

	describe "Home Page" do
	  before { visit root_path }

	end

	describe "Help Page" do
	  before { visit help_path }
	
	end

	describe "About Me Page" do
		before { visit about_path }  
	end

	describe "Contact Page" do
	  	before { visit contact_path }
	end

end
