module Aktibibo
  module Activatable
    extend ActiveSupport::Concern

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def activatable
        scope :inactive, -> { where(activated_at: nil) }
        scope :active, -> { where.not(activated_at: nil) }
        scope :deactivated, -> { where.not(deactivated_at: nil) }
      end
    end

    def inactive?
      activated_at.blank? && deactivated_at.blank?
    end

    def active?
      activated_at.present? && deactivated_at.blank?
    end

    def deactivated?
      deactivated_at.present?
    end

    def activate
      return if active?
      self.activated_at = Time.now.utc if inactive?
      self.deactivated_at = nil if deactivated?
      save
    end

    def activate!
      fail Errors::AlreadyActivated if active?
      self.activated_at = Time.now.utc if inactive?
      self.deactivated_at = nil if deactivated?
      self.save!
    end

    def deactivate
      return if deactivated?
      self.deactivated_at = Time.now.utc
      save
    end

    def deactivate!
      fail Errors::AlreadyDeactivated if deactivated?
      self.deactivated_at = Time.now.utc
      self.save!
    end
  end
end
