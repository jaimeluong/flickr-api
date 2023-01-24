class PagesController < ApplicationController
    require 'flickr'

    def index
        @flickr = Flickr.new

        if params[:username]
            @nsid = @flickr.people.findByUsername(username: params[:username])['nsid']
        else
            @nsid = ""
        end
    end
end
