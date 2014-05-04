require "spec_helper"

feature 'Accounts index' do
  context 'logged in users' do
    scenario 'after sign in it should redirect to accounts page' do
      account = create :account
      sign_in account.owner, attributes_for(:user)[:password]
      expect(page.current_url).to match(/#{subscribem.accounts_path}/)
      expect(page).to have_text(account.name)
    end
  end
  context 'guests users' do
    scenario 'should not let them in'  do
      visit subscribem.accounts_path
      expect(page.current_url).to match(/#{subscribem.new_user_session_path}/)
      expect(page).to have_text('You need to sign in or sign up before continuing')
    end
  end
end
