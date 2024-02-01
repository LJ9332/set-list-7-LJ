require "rails_helper"

RSpec.describe "Song Index Page" do
    describe "As a user" do
        describe "when I visit '/songs'" do
            it "I see each song's title and play count" do
                purple = Song.create!(title: 'Purple Rain', length: 845, play_count: 8599)
                beret = Song.create!(title: 'Raspberry Beret', length: 665, play_count: 99)
                doves = Song.create!(title: 'When Doves Cry', length: 240, play_count: 100000)
            
                visit "/songs"

                expect(page).to have_content('Purple Rain')
                expect(page).to have_content('Raspberry Beret')
                expect(page).to have_content('When Doves Cry')

                expect(page).to have_content(purple.play_count)
                expect(page).to have_content(beret.play_count)
                expect(page).to have_content(doves.play_count)
            end

        end
    end


end
