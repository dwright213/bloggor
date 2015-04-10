require 'rails_helper'

describe "The blog creating and viewing process" do

  it "will allow user to create a blog" do
    visit root_path
    click_on "Write a new blog"
    fill_in "Title", :with => "Blogging!!"
    fill_in "Body", :with => "The future is now!!"
    click_on "Create Blog"
    expect(page).to have_content "Blogging!!"
  end

  it "will allow user to add a comment to an existing blog" do
    visit root_path
    click_on "Write a new blog"
    fill_in "Title", :with => "Blogging!!"
    fill_in "Body", :with => "The future is now!!"
    click_on "Create Blog"
    click_on "Blogging!!"

    click_on "Add a comment"
    fill_in "Name", :with => "Paul"
    fill_in "Body", :with => "THis is a very interesting blog! what an amazing resource!"
    click_on "Create Comment"

    expect(page).to have_content "THis is a very interesting blog! what an amazing resource!"
  end

end
