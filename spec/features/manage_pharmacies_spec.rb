require 'rails_helper'

RSpec.feature "Manage pharmacies", type: :feature, js: true do
  it 'should do stuff' do
    visit '/pharmacies'

    click_on 'New Pharmacy'
    fill_in 'Name', with: 'Ultimo Chemist Plus'

    click_on 'Add an open period'
    fill_in 'Day', with: 'Thursday'
    fill_in 'Time from', with: '09:00 am'
    fill_in 'Time to', with: '08:00 pm'

    click_on 'Create Pharmacy'
    expect(page).to have_content 'successfully created'

    click_on 'Back'
    within('tr', text: 'Ultimo Chemist Plus') do
      click_on 'Show'
    end
    expect(page).to have_content 'Thursday'
    expect(page).to have_content '09:00:00'
    expect(page).to have_content '20:00:00'
  end
end
