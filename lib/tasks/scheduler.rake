desc "This task is called by the Heroku scheduler add-on to change batch weekly"
task :change_batch => :environment do
  if Date.today.monday? # task is scheduled on Heroku at 4am UTC
    puts "Creating a new batch, opening the pending batch, closing the active batch"
    ChangeBatchJob.perform_now
    puts "Done."
  end
end

