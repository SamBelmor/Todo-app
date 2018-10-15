class Item < ApplicationRecord
  belongs_to :user

  scope :pending, -> {
    where(completed_at: nil)
  }

  def completed?
    !completed_at.blank?
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |result|
        csv << result.attributes.values_at(*column_names)
      end
    end
  end
end
