require 'simplecov'
SimpleCov.start

require 'person'

RSpec.describe 'Person' do
  let(:create_kuba) { Person.new('Jakub', 'Lakowski') }

  describe '#initialization' do
    it 'initializes without errors' do
      expect { create_kuba }.not_to raise_error
    end

    it 'initializes with proper values' do
      person = create_kuba
      expect(person.first_name).eql?('Jakub')
      expect(person.surname).eql?('Lakowski')
    end
  end
end
