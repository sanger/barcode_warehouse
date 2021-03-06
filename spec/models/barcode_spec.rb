require 'spec_helper'

describe Barcode do
  context 'with uuid' do
    it_behaves_like 'a component resource', {:barcodable_uuid =>"11111111-2222-3333-4444-555555555556", :barcode_type => 'OtherBarcode' }


    let(:json) do
      {
        "barcodable_uuid" => "11111111-2222-3333-4444-555555555555",
        "barcodable_type" => "Plate",
        "machine_readable_barcode" => "1220000010734",
        "human_readable_barcode" => "DN10I",
        "barcode_type" => "SangerEan13"
      }
    end

    # Updated json is used by the component_resource specs to let
    # us avoid triggering the uniqueness constraint on "machine_readable_barcode"
    # and barcode_type
    let(:updated_json) do
      {
        "barcodable_uuid" => "11111111-2222-3333-4444-555555555555",
        "barcodable_type" => "Plate",
        "machine_readable_barcode" => "1220000011754",
        "human_readable_barcode" => "DN10J",
        "barcode_type" => "SangerEan13"
      }
    end

  end
end
