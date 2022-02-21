class ESWatchPage < UniversalPage
  include PageObject

  page_url "#{@base_url}/"

  div(:herocard, xpath: "//*[contains(@class,'flex justify-center')]")
  a(:watchtab, xpath: "//*[contains(text(),'Watch') or contains(text(),'VIDEO')]")
  a(:resulttab, xpath: "//*[contains(text(),'Watch') or contains(text(),'Result')]")
  div(:premiumtab, xpath: "//*[contains(text(),'Premium')]")
  h3(:originalsfirstchannel, xpath: "//*[@id='title'])[1]")
  div(:shortvideostab, xpath: "//*[contains(text(),'Latest Videos')]")
  buttons(:onetrust, xpath: "//*[contains(text(),'I Accept')]")
  span(:signin, xpath: "//*[contains(text(),'Sign In')]")
  text_field(:email, name: "email")
  text_field(:password, name: "password")
  div(:submit_button, xpath: "//*[contains(@class,'submit-wrapper__21pzb')]")
  div(:premiumvideo, xpath: "//*[contains(@class,'ab-banner-content')]")
  
  # Locators added
  div(:hero_card_img, xpath: "//*[@class='flex justify-center h-full']")
  h2(:top_stories, xpath: "//*[contains(text(),'Top stories')]")
  div(:secondary_card, css: "[data-testid='enriched-hero-card']>div:nth-child(3)")
  div(:rail_card, xpath: "//*[@role='listbox']")
  h2(:content_thumbnail, xpath: "//*[contains(@class,'caps-s3')]")
  span(:filter_by_channel, xpath: "//*[contains(text(),'Filter by channel')]")
  div(:calendar_epg, xpath: "//*[@aria-label='date-slider']")
  button(:view_earlier, xpath: "//*[@data-testid='view-more-button']")
  button(:hide_earlier, xpath: "//*[@data-testid='view-more-button']")
  div(:on_now_label, xpath: "//*[@data-testid='label-LIVE']")
  h1(:page_title, xpath: "//*[@data-testid='page-title']")
  div(:shedule_today, xpath: "//div[@class='programs-wrapper mb-5']//section")
  button(:prev_button, xpath: "//*[@data-testid='prev-button']")
  button(:next_button, xpath: "//*[@data-testid='next-button']")
  div(:on_now_label, xpath: "//*[@data-testid='label-LIVE']")
  h3(:sports_category, xpath: "//*[contains(@class,'HybridCard__title')]/parent::div/div")
  div(:thumbnail, xpath: "//*[contains(@class,'flex items-start flex-grow')]")
  div(:premium_label, xpath: "//*[contains(@class,'flex ml-auto')]/div")
  h3(:video_title, xpath: "//*[contains(@class,'HybridCard__title')]")
  
  # Video page submenu
  div(:liveandscheduletab, xpath: "//*[contains(text(),'Live & Schedule')]")
  div(:originalstab, xpath: "//*[contains(text(),'Shows')]")
  div(:latestvideos_tab, xpath: "//*[contains(text(),'Latest Videos')]")
  div(:bysporttab, xpath: "//*[contains(text(),'By Sport')]")
  h1(:latestvideos_page_title, xpath: "//*[contains(text(),'Latest Videos')]")
  h1(:bysports_page_title, xpath: "//*[contains(text(),'Sports')]")
  h1(:shows_page_title, xpath: "//*[contains(text(),'Shows')]")
  div(:liveandschedule_page_title, xpath: "//*[contains(text(),'Now on Eurosport channels')]")
  
  # Video PLayback options
  div(:first_video, xpath: "//*[contains(@class,'VideoRailCard__image')]")
  div(:watch_video_player, xpath: "//*[@data-testid='watch-video-player-without-playlist']")

  # Video Player controllers
  div(:player_buttons, xpath: "//*[contains(@data-testid,'player-buttons')]")
  div(:video_play_button, xpath: "//*[@data-testid='player-button-play']")
  h1(:video_title, xpath: "//*[contains(@data-testid,'herodescriptionblock-title')]")
  div(:video_progress_bar, xpath: "//*[contains(@data-testid,'player-slider-seek')]")
  div(:video_volume_button, xpath: "//*[contains(@data-testid,'player-volume-container')]")
  div(:maximize_button, xpath: "//*[contains(@class,'Player__bottom')]")
  button(:share_button, xpath: "//*[contains(@data-testid,'share-button')]")
  div(:previous_button, xpath: "//*[contains(@data-testid,'player-button-forward')]")
  div(:rewind_button, xpath: "//*[contains(@data-testid,'player-button-rewind')]")

  def scroll_to_page(video_title)
    max_scroll = 30
    while max_scroll >= 0
      break if h3s(:text, video_title.to_s).size.positive?

      send_keys :page_up
      max_scroll -= 1
    end
    h3(:text, video_title.to_s)
  end

  def video_title(video_title)
    video_title = h3(:text, video_title.to_s)
    video_title.click
  end

  def user_name_details
    credentials = JSON.parse(ENV["EURO_LOGIN"])
    username_key = credentials.keys[0]
    credentials[username_key]
  end

  def password_details
    credentials = JSON.parse(ENV["EURO_LOGIN"])
    password_key = credentials.keys[1]
    credentials[password_key]
  end
end
