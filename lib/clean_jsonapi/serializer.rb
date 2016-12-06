module CleanJSONAPI
  class Serializer
    attr_reader :definition

    def initialize(params)
      @definition = params.fetch(:definition)
    end

    def attributes_hash(obj)
      root_attributes.each_with_object({}) do |attribute_name, attributes_hash|
        attributes_hash[attribute_name] = obj.public_send(attribute_name)
      end
    end

    private

    def root_attributes
      definition.attributes
    end
  end
end
