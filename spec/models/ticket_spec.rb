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

  describe 'title:hoge,body:fugaのチケットが１件登録されている場合' do
    before do
      ticket = FactoryGirl.create(:ticket, { title: 'hoge', body: 'fuga' })
      @inserted_ticket = Ticket.find(ticket.id)
    end
    it 'チケット総数が1件であること' do
      expect(Ticket.count).to eq 1
    end
    it '登録したチケットのtitleが正しいこと' do
      expect(@inserted_ticket.title).to eq 'hoge'
    end
    it '登録したチケットのbodyが正しいこと' do
      expect(@inserted_ticket.body).to eq 'fuga'
    end
  end

  describe 'チケットに担当者を指定できる' do
    it 'デフォルトでは担当者はいない' do
      ticket = FactoryGirl.create(:ticket)
      expect(ticket.assignee).to be_nil
    end
  end
end
