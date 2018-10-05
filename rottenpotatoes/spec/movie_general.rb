require 'rails_helper'
 describe MoviesController, :type => :controller do
    
    before(:each) do
        @m1 = Movie.create(title: "HarryPotter",rating: "G", description:"Magic and More!", director: "Mr Visionary",release_date: 20150101)
        @m2 = Movie.create(title: "HP2",rating: "G",director: "boogeyman",release_date: 20160101)
        @m3 = Movie.create(title: "HP3",rating: "G",director: "boogeyman",release_date: 20160101)
    end

     describe "#new" do
        it "new movie" do
            get :new,  movie_id: @m1[:id]
            expect(Movie.find(@m1.id)[:title]).to eq("HarryPotter")
            expect(response).to render_template(:new)
        end
    end
    
    describe "#delete" do
        it "delete movie" do
            expect{ delete :destroy, id: @m2[:id]}.to change{Movie.all.count}.by(-1)
        end 
    end
    
    describe "with same director action" do
      it "return if director exists" do
            get :similar_movies,  id: @m3[:id]
            expect(Movie.where(:director => @m3.director).size).to eq(2)
      end
    end
end 