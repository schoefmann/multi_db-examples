class ApplicationController < ActionController::Base
  after_filter { ActiveRecord::Base.connection_proxy.next_reader! }
  helper :all

  protect_from_forgery
end
