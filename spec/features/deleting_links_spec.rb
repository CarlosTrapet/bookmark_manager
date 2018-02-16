feature 'delete links' do 
  scenario ':user can delete links' do 
    visit '/'
    within '#link-1' do 
      click_button 'delete'
    end
    expect(current_path).to eq '/'
    expect(page).not_to have_content("Facebook")
  end
end