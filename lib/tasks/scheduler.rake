desc "This task is called by the Heroku scheduler add-on to change batch weekly"
task :change_batch => :environment do
  if Date.today.tuesday?
  puts "Creating a new batch, opening the pending batch, closing the active batch"
  ChangeBatchJob.perform_now
  puts "Done."
  end
end

