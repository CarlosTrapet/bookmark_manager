feature 'Adding a link to the list of bookmarks' do
  scenario 'Fills in bookmark form and adds link to bookmarks' do
    visit '/'
    fill_in 'new_title', with: 'Random'
    fill_in 'new_link', with: 'http://www.random.com'
    click_button 'Add Bookmark'
    expect(page).to have_content('http://www.random.com')
    expect(page).to have_content('Random')
  end
end
