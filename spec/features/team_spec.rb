require "spec_helper"

feature "Posts" do
  let(:user) { user }

  before :each do
    login_with_oauth
  end

  scenario "create a team" do
    team_name = "LearningSpaces"
    team_description = "An awesome platform to share information"
    visit teams_path

    click_link I18n.t("teams.new_team")

    fill_in I18n.t("teams.name"), with: team_name
    fill_in I18n.t("teams.description"), with: team_description

    click_button I18n.t("teams.create_team")

    expect(page).to have_content(team_name)
  end

  scenario "cannot create a team without a name" do
    team_name = "LearningSpaces"
    team_description = "An awesome platform to share information"
    visit teams_path

    click_link I18n.t("teams.new_team")

    fill_in I18n.t("teams.description"), with: team_description

    click_button I18n.t("teams.create_team")

    expect(page).to have_content(I18n.t("teams.fail"))
    expect(page).to have_content(I18n.t("errors.messages.blank"))
  end
end

