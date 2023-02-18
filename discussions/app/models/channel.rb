# frozen_string_literal: true

class Channel < ApplicationRecord
  has_many :discussions
  has_many :users, through: :discussions
  resourcify

  extend FriendlyId
  friendly_id :channel, use: %i[slugged finders]

  def should_generate_new_friendly_id?
    channel_changed?
  end
end
