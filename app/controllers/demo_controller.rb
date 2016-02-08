class DemoController < ApplicationController

	layout false

	#index is an action
	def index
		#render, just rendering the template, no code to execute before the rendering
		#render('hello')
	end

	def hello
		#render('index')
		@array = [1, 2, 3, 4, 5]
		@id = params['id'].to_i
		@page = params[:page].to_i
	end

	def other_hello
		redirect_to(:controller => 'demo', :action => 'index')
	end

	def demo_google
		redirect_to("http://www.google.com")
	end

	def escape_output
	end
end
