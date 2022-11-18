require 'rails_helper'

RSpec.describe 'Testing food views', type: :feature do
  describe 'Food#index' do
    before(:each) do
      user = User.new(name: 'sharon', email: 'sharon@microsoft.info', password: 'password',
                      password_confirmation: 'password')
      user.skip_confirmation_notification!
      user.skip_confirmation!
      user.save
      (1..5).each { |i| Food.create(name: "Test food #{i}", price: 10, measurement_unit: 'grams') }

      visit new_user_session_path

      page.fill_in 'user[email]', with: 'sharon@microsoft.info'
      page.fill_in 'user[password]', with: 'password'
      click_button 'Log in'
      visit foods_path
    end

    it 'can see all the food' do
      expect(page).to have_content 'Test food 1'
      expect(page).to have_content 'Test food 2'
      expect(page).to have_content 'Test food 3'
      expect(page).to have_content 'Test food 4'
      expect(page).to have_content 'Test food 5'
    end

    it 'should be able to see delete buttons for each food' do
      within('table') do
        expect(find_all('delete').length).to eq 0
      end
    end
  end
end
