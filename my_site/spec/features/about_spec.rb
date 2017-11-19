require 'spec_helper'

describe 'cv', type: :feature do

  before do
    visit '/about.html'
  end

  it 'displays titles for paragraphs' do
    expect(page).to have_selector 'h5'
  end

  it 'displays correct h5 text' do
    expect(page).to have_content 'HYPER ISLAND'
  end

  it 'displays correct p text' do
    expect(page).to have_content 'for clients such as'
  end

  it 'displays buttons' do
    expect(page).to have_selector 'button.btn.btn-primary'
  end

  it 'displays images' do
    expect(page).to have_selector 'img.img-fluid'
  end

  it 'displays CV list' do
     expect(page).to have_css '.CV'
     within '.CV' do
       expect(page).to have_content 'HYPER ISLAND'
       expect(page).to have_content 'Florence, IT'
       expect(page).to have_content 'Digital Media Programme'
     end
  end

  it 'shows a link to contact' do
    expect(page).to have_css 'a', text: 'Contact'
  end

  it 'displays modal and modal header' do
    expect(page).to have_css '.modal'
    within '.modal' do
      expect(page).to have_content 'CV'
    end
  end

end
