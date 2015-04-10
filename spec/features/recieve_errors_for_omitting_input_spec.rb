require 'rails_helper'

describe "The blog and comment creation error handling process" do

  it "will notify a user of an error if they forget to enter a blog body" do
    visit root_path
    click_on "Write a new blog"
    fill_in "Title", :with => "Blogging!!"
    click_on "Create Blog"
    expect(page).to have_content "errors"
  end

  it "will notify a user of an error if they forget to enter a blog title" do
    visit root_path
    click_on "Write a new blog"
    fill_in "Body", :with => "The future is now!!"
    click_on "Create Blog"
  end

  it "will notify a user of an error if they forget to enter anything" do
    visit root_path
    click_on "Write a new blog"
    click_on "Create Blog"
  end

  it "will notify a user of an error if they forget to enter a name when adding a comment on a blog" do
    visit root_path
    click_on "Write a new blog"
    fill_in "Title", :with => "Blogging!!"
    fill_in "Body", :with => "The future is now!!"
    click_on "Create Blog"
    click_on "Blogging!!"

    click_on "Add a comment"
    fill_in "Body", :with => "THis is a very interesting blog! what an amazing resource!"
    click_on "Create Comment"

    expect(page).to have_content "errors"
  end

  it "will notify a user of an error if they forget to enter a message body when adding a comment on a blog" do
    visit root_path
    click_on "Write a new blog"
    fill_in "Title", :with => "Blogging!!"
    fill_in "Body", :with => "The future is now!!"
    click_on "Create Blog"
    click_on "Blogging!!"

    click_on "Add a comment"
    fill_in "Name", :with => "Paul"
    click_on "Create Comment"

    expect(page).to have_content "errors"
  end

  it "will notify a user of an error if they forget to enter anything when adding a comment on a blog" do
    visit root_path
    click_on "Write a new blog"
    fill_in "Title", :with => "Blogging!!"
    fill_in "Body", :with => "The future is now!!"
    click_on "Create Blog"
    click_on "Blogging!!"

    click_on "Add a comment"
    click_on "Create Comment"

    expect(page).to have_content "errors"
  end

end
