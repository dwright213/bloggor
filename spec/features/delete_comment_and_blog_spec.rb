require 'rails_helper'

describe "The blog and comment deleting process" do

  it "will allow user to edit an existing blog comment" do
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
    click_on "Delete this comment"

    expect(page).to have_content "Comment successfully deleted."
  end

  it "will allow user to delete an existing blog" do
    visit root_path
    click_on "Write a new blog"
    fill_in "Title", :with => "Blogging!!"
    fill_in "Body", :with => "The future is now!!"
    click_on "Create Blog"
    click_on "Blogging!!"
    click_on "Delete this Blog"

    expect(page).to have_content "Blog successfully deleted."
  end

end
