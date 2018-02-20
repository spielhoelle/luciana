module Admin
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    before_action :authenticate_user!
    before_action :common_content

    def common_content
      @contacts = Contact.all
      @page_title = "#{ controller_name.capitalize}-#{action_name.capitalize}"
    end

  end
end
