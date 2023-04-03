class SampleWorker
    include Sidekiq::Job

    # user_id = 1
    def perform(user_id)
        @user = User.find(user_id)
        puts @user
    end

end