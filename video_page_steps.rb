Given("I'm on the homepage") do
  on(ESHomePage) do |page|
    page.one_trust_agree_element.click if page.one_trust_agree_element.present?
    expect(page.herocard_element.present?).to be_truthy
  end
end

When("I click on watch tab from the top menu") do
  on(ESHomePage) do |page|
    page.watch_tab_element.present?
    page.watch_tab_element.click
  end
end

Then("I validate the submenu options in the watch page") do
  on(ESWatchPage) do |_page|
    expect(liveandscheduletab_element.present?).to be_truthy
    expect(originalstab_element.present?).to be_truthy
    expect(bysporttab_element.present?).to be_truthy
    expect(latestvideos_tab_element.present?).to be_truthy
  rescue StandardError => e
    p e.backtrace
  end
end

Given("I'm on the videos page") do
  step "I click on watch tab from the top menu"
end

When("I click on live&shedule tab") do
  on(ESWatchPage) do |page|
    page.liveandscheduletab_element.present?
    page.liveandscheduletab_element.click
  end
end

When("I click on latest videos tab") do
  on(ESWatchPage) do |page|
    page.latestvideos_tab_element.present?
    page.latestvideos_tab_element.click
  end
end

When("I click on shows tab") do
  on(ESWatchPage) do |page|
    page.originalstab_element.present?
    page.originalstab_element.click
  end
end

When("I click on bysport tab") do
  on(ESWatchPage) do |page|
    page.bysporttab_element.present?
    page.bysporttab_element.click
  end
end

When("I should be navigated to {string} page") do |tab|
  on(ESWatchPage) do |page|
    case tab
    when "LIVE & SHEDULE"
      page.wait_until { page.liveandschedule_page_title.present? }

    when "LATEST VIDEOS"
      page.wait_until { page.latestvideos_page_title.present? }

    when "SHOWS"
      page.wait_until { page.shows_page_title.present? }

    when "BYSPORT"
      page.wait_until { page.bysports_page_title.present? }
    end
  end
end

When("I click on first video in the page") do
  on(ESWatchPage) do |page|
    page.first_video_element.present?
    page.first_video_element.click
  end
end

Then("I should be redirected video playback page") do
  on(ESWatchPage) do |page|
    sleep 10 # rubocop:disable Custom/SleepCop
  # page.wait_until(30) { page.watch_video_player.visible? }
    expect(watch_video_player.present?).to be_truthy
  rescue StandardError => e
    p e.backtrace
  end
end

Then("I should validate the controller options") do
  on(ESWatchPage) do |_page|
    sleep 10 # rubocop:disable Custom/SleepCop
  # page.wait_until (30){ page.watch_video_player.visible? }
    expect(video_play_button.present?).to be_truthy
    expect(video_progress_bar.present?).to be_truthy
    expect(video_volume_button.present?).to be_truthy
    expect(maximize_button.present?).to be_truthy
    expect(share_button.present?).to be_truthy
    expect(previous_button.present?).to be_truthy
    expect(rewind_button.present?).to be_truthy
  rescue StandardError => e
    p e.backtrace
  end
end
