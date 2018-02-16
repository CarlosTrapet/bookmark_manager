feature 'update link' do
  scenario 'user can update a link' do
    visit '/'

    within '#link-1' do
      click_button "edit"
    end

    expect(current_path).to eq '/edit_link/1'

    expect(page).to have_selector("input[value='Facebook']")
    expect(page).to have_selector("input[value='http://www.facebook.com']")

    fill_in("new_title", with: "Caralibro")
    click_button "Update"

    expect(page).to have_content "Caralibro"
  end
end