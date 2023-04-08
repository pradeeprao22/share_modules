class SampleWorker
    include Sidekiq::Worker
    sidekiq_options retry: true

    user_id = 1
    # Task perform once
    def perform(user_id)
        @user = User.find(user_id)
        puts "Process Done"
    end
end