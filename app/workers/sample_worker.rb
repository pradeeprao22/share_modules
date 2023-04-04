class SampleWorker
    include Sidekiq::Job

    user_id = 1
    # Task perform once
    def perform(user_id)
        @user = User.find(user_id)
        # puts @user
    end

end