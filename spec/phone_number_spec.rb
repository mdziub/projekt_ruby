require 'simplecov'
SimpleCov.start

require 'phone_number'

RSpec.describe 'PhoneNumber' do
  let(:phone_number) { PhoneNumber.new('500-5-00300', PhoneNumber::PERSONAL) }

  describe '#constructor' do
    it 'initializes without errors' do
      expect { phone_number }.not_to raise_error
    end

    it 'removes dashes when initializing' do
      expect(phone_number.phone_number).to eql('500500300')
    end
  end

  describe '#to_s' do
    it 'formats number properly' do
      expect(phone_number.to_s).to eql('500-500-300')
    end
  end

  describe '#to_html' do
    it 'formats html properly' do
      expect(phone_number.to_html).to eql('<b>Personal</b>: 500-500-300')
    end
  end
end
