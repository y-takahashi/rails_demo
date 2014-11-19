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
      puts page.body
      expect(page).to have_css('p#notice')
      expect(page).to have_content('ha-gendattu')
      expect(page).to have_content('merosangoti')
    end
  end
end
