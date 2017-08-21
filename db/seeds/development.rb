module Seeds
  class Development
    USERS_COUNT            = 10_000
    MOVIES_COUNT           = 500
    ACTORS_COUNT           = 2_000
    VOTES_MIN_COUNT        = 100
    RANDOM_VOTES_PER_MOVIE = 200

    def run
      create_users if User.count == 0
      create_movies if Movie.count == 0
      create_actors if Actor.count == 0
      create_roles if Role.count == 0
      create_votes if Vote.count == 0
    end

    private

    def create_users
      USERS_COUNT.times do
        FactoryGirl.create(:user)
      end

      @users = User.all.to_a
    end

    def create_movies
      MOVIES_COUNT.times do
        director = FactoryGirl.create(:director)
        FactoryGirl.create(:movie, director: director)
      end
    end

    def create_actors
      ACTORS_COUNT.times do
        FactoryGirl.create(:actor)
      end
    end

    def create_roles
      paginator = RandomPaginator.new

      Movie.find_each do |movie|
        actors = paginator.paginate(Actor.order(:id))
        actors.each do |actor|
          FactoryGirl.create(:role, movie: movie, actor: actor)
        end
      end
    end

    def create_votes
      Movie.find_each do |movie|
        Vote.create(generate_votes_attrs(movie))
      end
    end

    def generate_votes_attrs(movie)
      (rand(RANDOM_VOTES_PER_MOVIE) + VOTES_MIN_COUNT).times.map do
        {
          rating: rating,
          movie: movie,
          user: @users[ rand(@users.size) ]
        }
      end
    end

    def rating
      rand(10) + 1
    end

    class RandomPaginator
      def initialize
        @offset = 0
      end

      def paginate(collection)
        page_size = per_page
        result = collection.limit(page_size).offset(@offset).to_a
        @offset += page_size

        if result.size == 0
          @offset = 0
          collection.limit(page_size).offset(@offset).to_a
        else
          result
        end
      end

      def per_page
        20 + rand(15)
      end
    end

  end
end
