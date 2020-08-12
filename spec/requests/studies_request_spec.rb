require 'rails_helper'

RSpec.describe "Studies", type: :request do
  describe 'studies page' do
    context 'when not logged in' do
      it 'redirects user to sign_in page' do
        visit '/studies'
        expect(current_url).to eq(new_user_session_url)
      end
    end

    context 'when logged in' do
      it 'should go to the studies page' do
        user = user_sign_in
        to_visit = "http://#{user.username}.example.com/studies"
        visit to_visit
        expect(current_url).to eq("http://#{user.username}.example.com/studies")
      end
    end
  end

  describe 'creating a new study' do
    context 'when clicking new study' do
      it 'should display the new studies page' do
        user = user_sign_in
        visit "http://#{user.username}.example.com/studies"
        click_link 'Create Study'
        expect(current_url).to eq("http://#{user.username}.example.com/studies/new")
      end
    end

    context 'when creating a new study' do
      it 'should redirect to trials list' do
        user = user_sign_in
        visit "http://#{user.username}.example.com/studies"
        click_link 'Create Study'
        expect(current_url).to eq("http://#{user.username}.example.com/studies/new")
        fill_in 'study[study_name]', with: 'test_study'
        click_button 'Create Study'
        expect(current_url).to eq("http://#{user.username}.example.com/studies/1")
        expect(page).to have_content("Trials")
      end
    end
  end
end
