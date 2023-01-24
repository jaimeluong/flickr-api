class PagesController < ApplicationController
    require 'flickr'

    def index
        @flickr = Flickr.new

        if params[:username]
            begin
                @id = @flickr.people.findByUsername(username: params[:username])['nsid']
                @photos = @flickr.people.getPublicPhotos(user_id: @id, per_page: 5, extras: "url_m, url_s")
            rescue
                @error = "Could not find user"
            end
        end
    end
end
