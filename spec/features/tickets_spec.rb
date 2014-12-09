require 'rails_helper'

feature "Tickets", :type => :feature do
  describe 'チケット一覧画面' do
    it '一覧画面アクセス' do
      visit tickets_path
      expect(page.current_url).to eq tickets_url
    end
    it 'データを登録して一覧画面にアクセス' do
     FactoryGirl.create(:ticket, {title: 'taitoru', body: 'bodeiiii'})
      visit tickets_path
      expect(page).to have_content('taitoru')
      expect(page).to have_content('bodeiiii')
    end
  end

  describe 'チケット新規登録画面' do
    before do
      @users = []
      (1..10).each do
          @users << FactoryGirl.create(:user)
      end
      visit tickets_path
      click_link_or_button 'New Ticket'
    end
    it '新規登録画面へのリンクで遷移' do
      expect(page.current_url).to eq new_ticket_url
    end
    it '新規登録画面から一覧画面への遷移' do
      click_link_or_button 'Back'
      expect(page.current_url).to eq tickets_url
    end
    it 'チケット新規登録' do
      fill_in 'ticket_title', with: 'ha-gendattu'
      fill_in 'ticket_body', with: 'merosangoti'
      click_link_or_button 'Create Ticket'
      expect(page).to have_css('p#notice')
      expect(page).to have_content('ha-gendattu')
      expect(page).to have_content('merosangoti')
    end
  end

  # 宿題
  describe '編集画面について' do
    before do
      @ticket = FactoryGirl.create(:ticket)
      @user = FactoryGirl.create(:user)
      visit tickets_path
      click_link_or_button 'Edit'
    end
    it '編集画面にアクセスできる' do
      expect(page.current_path).to eq '/tickets/%d/edit' % @ticket.id
    end
    it '編集画面からデータを変更できる' do
      fill_in 'ticket_title', with: 'メロメロメロ'
      fill_in 'ticket_body', with: '全力マン'
      check 'ticket_finished'
      select '2015', from: 'ticket_expires_at_1i'
      select 'April', from: 'ticket_expires_at_2i'
      select '25', from: 'ticket_expires_at_3i'
      select '10', from: 'ticket_expires_at_4i'
      select '30', from: 'ticket_expires_at_5i'
      click_link_or_button 'Update Ticket'

      expect(page).to have_css('p#notice')
      expect(page).to have_content('メロメロメロ')
      expect(page).to have_content('全力マン')
      expect(page).to have_content('Finished: true')
      expect(page).to have_content('2015-04-25 10:30:00')
    end
  end
end
