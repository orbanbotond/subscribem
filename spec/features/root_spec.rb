require "spec_helper"

feature 'Root page' do
  context 'signed in users' do
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
