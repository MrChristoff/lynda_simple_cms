class DemoController < ApplicationController

  layout false

  # a method in a controller is refered to as an 'Action'
  def index
    # render(template => 'demo/index') #verbose
    # render('demo/hello') #will look in 'demo' folder by convention
    render('index') #default template for blank action
  end

  def hello
    render('hello')
  end

  def other_hello
    # redirect_to(:controller => 'demo', :action => 'index')
    redirect_to(:action => 'index')
  end

  def lynda
    #redirect can be to external url
    redirect_to('http://lynda.com')
  end

end
