require 'spec_helper'
require 'rails_helper'

describe "Viewing an individual movie" do
  it "shows the movies details" do

  movie = Movie.create(title: "Iron Man",
                        rating: "PG-13",
                        total_gross: 318412101.00,
                        description: "Tony Stark builds an armored suit to fight the throes of evil",
                        released_on: "2008-05-02")

  visit movie_url(movie)

  expect(page).to have_text(movie.title)
  expect(page).to have_text(movie.rating)
  expect(page).to have_text(movie.description)
  #was erroring because I did not add ',' and told it in view to convert to currency. GOTCHA!
  #expect(page).to have_text("$318412101.00")
  expect(page).to have_text("$318,412,101.00")

  expect(page).to have_text(movie.released_on)

  end
end


