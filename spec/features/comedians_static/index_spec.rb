require "rails_helper"

RSpec.describe "As a visitor", type: :feature do

  before(:each) do
    @comedian_1 = Comedian.create(name: "John Mulany", age: 37, city: "Chicago", \
    image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCCUVWI5B-6-80aviR_4WtoJqCsu33NEKB18j_xZ7UT4WpWhQa")
    @comedian_2 = Comedian.create(name: "Mitchell Hedberg", age: 37, city: "Saint Paul", \
    image: "https://pixel.nymag.com/imgs/daily/vulture/2018/05/02/02-john-mulaney.w700.h700.jpg")
    @comedian_3 = Comedian.create(name: "George Carlin", age: 71, city: "Manhattan", \
    image: "https://pixel.nymag.com/imgs/daily/vulture/2018/09/23/1-George-Carlin.w330.h330.jpg")
  end
  describe "when I visit /comedians" do

    it "loads a page" do
      visit "/comedians"

      expect(page.status_code).to eq(200)
      expect(current_path).to eq("/comedians")
    end

    it "shows comedian demographics" do
      visit "/comedians"
      #unsure of final layout, will target once design is complete.
      # within("div#comedian_list") do
        expect(page).to have_content(@comedian_1.name)
        expect(page).to have_content("Age: #{@comedian_1.age}")
        expect(page).to have_content("Hometown: #{@comedian_1.city}")
        expect(page).to have_content(@comedian_2.name)
        expect(page).to have_content("Age: #{@comedian_2.age}")
        expect(page).to have_content("Hometown: #{@comedian_2.city}")
        expect(page).to have_content(@comedian_3.name)
        expect(page).to have_content("Age: #{@comedian_3.age}")
        expect(page).to have_content("Hometown: #{@comedian_3.city}")
      # end
    end

    it "shows comedian thumbnail" do
      visit "/comedians"
      #unsure of final layout, will target once design is complete.
      # within("div#comedian_list") do
        actual1 = find("#comedian_#{@comedian_1.id}_thumbnail")[:src]
        expect(actual1).to eq(@comedian_1.image)

        actual2 = find("#comedian_#{@comedian_2.id}_thumbnail")[:src]
        expect(actual2).to eq(@comedian_2.image)

        actual3 = find("#comedian_#{@comedian_3.id}_thumbnail")[:src]
        expect(actual3).to eq(@comedian_3.image)
      # end
    end
  end
end
