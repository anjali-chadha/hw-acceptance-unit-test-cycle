Given (/^the following movies exist:$/) do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create movie
  end
end

Then (/^the director of "(.+)" should be "(.+)"$/) do |movie_name, director|
  movie = Movie.find_by_title(movie_name)
  visit movie_path(movie)
  expect(movie.director).to eq director
end

Then /I should see "(.*)" before "(.*)"/ do |p, q|
  page.html.should match /#{p}.*#{q}/m
end