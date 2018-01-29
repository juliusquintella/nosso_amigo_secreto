class CampaignRaffleJob < ApplicationJob
  queue_as :email

  def perform(campaign)
    # Do something laterresults = RaffleService.new(campaign).call

    campaign.members.each {|m| m.set_pixel}
    results.each do |r|
      CampaignMailer.raffle(campaign, r.first, r.last).deliver_now
    end
    campaign.update(status: :finished)


    #if results == false
      # Send mail to owner of campaign (desafio)
    #end
  end
end