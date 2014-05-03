require "spec_helper"

feature 'Root page' do
  context 'signed in users' do
    scenario 'Should redirect to the accounts page' do
      sign_in
      visit subscribem.root_path
      expect(page.current_url).to match(/#{subscribem.accounts_path}/)
    end
  end
  context 'guest users' do
    scenario 'Should have sign up link' do
      visit subscribem.root_path
      click_link 'Account Sign Up'
    end
    scenario 'Should have login link' do
      visit subscribem.root_path
      click_link 'Login'
    end
  end
end
