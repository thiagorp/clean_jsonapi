require 'clean_jsonapi/serializer'

RSpec.describe CleanJSONAPI::Serializer do
  describe '#attributes_hash' do
    it "serializes the attributes hash using the definition's attributes" do
      definition = double('definition', attributes: [:name, :email])
      obj = double('obj', name: 'John', email: 'john.doe@example.com', age: 15)
      subject = described_class.new(definition: definition)

      attributes = subject.attributes_hash(obj)

      expect(attributes).to eq({
        name: obj.name,
        email: obj.email
      })
    end

    it 'returns an empty hash if the definition is empty' do
      definition = double('definition', attributes: [])
      obj = double('obj', name: 'John', email: 'john.doe@example.com', age: 15)
      subject = described_class.new(definition: definition)

      attributes = subject.attributes_hash(obj)

      expect(attributes).to eq({})
    end

    it "raises if the object doesn't contain a defined attribute" do
      definition = double('definition', attributes: [:name])
      obj = Object.new
      subject = described_class.new(definition: definition)

      serialization = -> { subject.attributes_hash(obj) }

      expect(serialization).to raise_error(NoMethodError)
    end
  end
end
