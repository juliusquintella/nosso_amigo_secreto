class CampaignRaffleJob < ApplicationJob
  queue_as :email

  def perform(campaign)
    puts "--- sasa"
    results = RaffleService.new(campaign).call
    puts "\n\n ------- AQUI 1 \n\n"
    campaign.members.each {|m| m.set_pixel}
    results.each do |r|
      CampaignMailer.raffle(campaign, r.first, r.last).deliver_now
    end
    puts "\n\n ------- AQUI \n\n"
    campaign.update(status: :finished)


    #if results == false
      # Send mail to owner of campaign (desafio)
    #end
  end
end
