require 'rails_helper'

RSpec.describe 'the songs show page' do
    it 'displays the song title' do
        artist = Artist.create!(name: 'Carly Rae Jepsen')
        song = artist.songs.create!(title: "I really like you", length: 208, play_count:2456357)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count:21456357)
        
        visit "/songs/#{song.id}"

        expect(page).to have_content(song.title)
        expect(page).to_not have_content(song_2.title)
    end

    it 'displays the name of the artist' do
        artist = Artist.create!(name: 'Carly Rae Jepsen')
        song = artist.songs.create!(title: "I really like you", length: 208, play_count:2456357)
        song_2 = artist.songs.create!(title: "Call Me Maybe", length: 207, play_count:21456357)
        
        visit "/songs/#{song.id}"
        #save_and_open_page
        expect(page).to have_content(artist.name)
    end
end