require 'rails_helper'

describe "The blog and comment editing process" do

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
    click_on "Edit this Comment"
    fill_in "Name", :with => "Paul"
    fill_in "Body", :with => "You are a quack and I don't believe you"
    click_on "Update Comment"

    expect(page).to have_content "You are a quack and I don't believe you"
  end

  it "will allow user to edit an existing blog" do
    visit root_path
    click_on "Write a new blog"
    fill_in "Title", :with => "Blogging!!"
    fill_in "Body", :with => "The future is now!!"
    click_on "Create Blog"
    click_on "Blogging!!"
    click_on "Edit this Blog"
    fill_in "Title", :with => "No More Blogging!!"
    fill_in "Body", :with => "The future is OVER!!"
    click_on "Update Blog"

    expect(page).to have_content "No More Blogging!!"
  end

end
