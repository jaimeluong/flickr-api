class PagesController < ApplicationController
    require 'flickr'

    def index
        @flickr = Flickr.new

        if params[:username]
            @id = @flickr.people.findByUsername(username: params[:username])['nsid']
            @photos = @flickr.people.getPublicPhotos(user_id: @id, per_page: 5, extras: "url_m, url_s")
        end
    end
end
