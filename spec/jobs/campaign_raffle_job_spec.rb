require 'rails_helper'

RSpec.describe CampaignRaffleJob, type: :job do
  include ActiveJob::TestHelper

  before(:each) do
    @campaign = create(:campaign, status: :pending)
  end

  context "Have enqueued job" do
    it "enqueued job" do
      expect {
        CampaignRaffleJob.perform_later @campaign
      }.to have_enqueued_job
    end

    it "passed arguments to job" do
      expect {
        CampaignRaffleJob.perform_later @campaign
      }.to have_enqueued_job.with(@campaign)
    end

    it "is in email queue" do
      expect {
        CampaignRaffleJob.perform_later @campaign
      }.to have_enqueued_job.on_queue("email") 
    end
  end

  context "Have been enqueued" do
    before(:each) do
      CampaignRaffleJob.perform_later @campaign
    end

    it "been enqueued" do
      expect(CampaignRaffleJob).to have_been_enqueued
    end

    it "passed arguments to job" do
      expect(CampaignRaffleJob).to have_been_enqueued.with(@campaign)
    end

    it "is in email queue" do
      expect(CampaignRaffleJob).to have_been_enqueued.on_queue("email")
    end
  end
end
