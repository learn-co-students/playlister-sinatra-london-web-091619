
class SongsController < ApplicationController

    get '/songs/?' do
        @songs = Song.all
        erb :"songs/index"
    end

    get '/songs/new' do
        
        erb :'songs/new'
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :"songs/show"
    end

    post '/songs' do
        @song = Song.new(:name => params[:Name])
        @song.artist = Artist.find_or_create_by(:name => params["Artist Name"])
        params[:genres].each do |genre|
            binding.pry
            @song.genres << Genre.find_by(name: genre)
        end
        @song.save
        
        redirect :"/songs/#{@song.slug}"
    end

   


    





end