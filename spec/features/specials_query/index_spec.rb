require "rails_helper"

RSpec.describe "As a visitor", type: :feature do

  before (:each) do
    @comedian_1 = Comedian.create(name: "Mitchell Hedberg", age: 37, city: "Saint Paul", \
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCCUVWI5B-6-80aviR_4WtoJqCsu33NEKB18j_xZ7UT4WpWhQa")
    @comedian_2 = Comedian.create(name: "John Mulany", age: 37, city: "Chicago", \
      image: "https://pixel.nymag.com/imgs/daily/vulture/2018/05/02/02-john-mulaney.w700.h700.jpg")
    @comedian_3 = Comedian.create(name: "George Carlin", age: 71, city: "Manhattan", \
      image: "https://pixel.nymag.com/imgs/daily/vulture/2018/09/23/1-George-Carlin.w330.h330.jpg")
    @comedian_4 = Comedian.create(name: "Donald Glover", age: 36, city: "Chicago", \
      image: "https://pixel.nymag.com/imgs/daily/vulture/2018/09/24/24-donald-glover.w330.h330.jpg")
    @special_1 = @comedian_1.specials.create(name: "Comedy Central Special", time: 37)
    @special_2 = @comedian_1.specials.create(name: "Mitch All Together", time: 43)
    @special_3 = @comedian_2.specials.create(name: "Kid Gorgeous at Radio City", time: 65)
    @special_4 = @comedian_2.specials.create(name: "The Comeback Kid", time: 62)
    @special_5 = @comedian_2.specials.create(name: "New in Town", time: 60)
    @special_6 = @comedian_3.specials.create(name: "Jammin' in New York", time: 57)
  end

  describe "When I visit /comedians?age=71" do

    it "shows a targeted statistics area" do
      visit "/comedians?age=71"

      expect(page).to have_content("Average age: #{@comedian_3.age.to_f.round(1)}")
      expect(page).to have_content("All hometowns: #{@comedian_3.city}")
      # expect(page).to have_content("Total specials: #{@comedian_3.specials.count}")
      # expect(page).to have_content("Average special runtime: #{@comedian_3.specials.first.time.to_f.round(1)}")
    end
  end
end
