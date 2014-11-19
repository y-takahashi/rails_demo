require 'rails_helper'

RSpec.describe Ticket, :type => :model do
  describe 'データを与えて新規作成' do
    before do
      @ticket = Ticket.new({title: 'foo', body: 'hogehoge', finished: false})
    end

    it 'title' do
      expect(@ticket.title).to eq 'foo'
    end
    it 'body' do
      expect(@ticket.body).to eq 'hogehoge'
    end
    it 'finished' do
      expect(@ticket.finished).to eq false
    end
  end

  describe 'validation' do
    let(:title) { 'foo' }
    let(:body) { 'hogehoge' }
    before do
      @ticket = Ticket.new({title: title, body: body})
    end
    context 'titleが空の場合' do
      let(:title) { nil }
      it { expect(@ticket).not_to be_valid }
    end

    context 'bodyが空の場合' do
      let(:body) { nil }
      it { expect(@ticket).not_to be_valid }
    end
  end
end
