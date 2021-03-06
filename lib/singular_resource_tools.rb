module SingularResourceTools

  extend ActiveSupport::Concern

  def latest(other)
    (updated_values?(other) && ( other.last_updated > last_updated )) ? yield(self) : self
  end

  module ClassMethods
    def create_or_update(attributes)
      new_atts = attributes.reverse_merge(:data => attributes)
      new_record = new(new_atts)
      for_lims(attributes.lims_id).with_id(new_atts["id_#{name.underscore}_lims"]).first.latest(new_record) do |record|
        record.update_attributes(new_atts) if record.present?
        record ||= new_record
        record.save!
      end
    end
    private :create_or_update
  end
end
