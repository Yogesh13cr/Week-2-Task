Feature: Video page Features

Scenario: Verify the submenu in the videos page
  Given I'm on the homepage
  When I click on watch tab from the top menu 
  Then I validate the submenu options in the watch page

Scenario: Navigation to live&shedule page in the submenu
  Given I'm on the videos page
  When I click on live&shedule tab
  Then I should be navigated to "LIVE & SHEDULE" page 

Scenario: Navigation to latest videos page in the submenu
  Given I'm on the videos page
  When I click on latest videos tab
  Then I should be navigated to "LATEST VIDEOS" page 

Scenario: Navigation to shows page in the submenu
  Given I'm on the videos page
  When I click on shows tab
  Then I should be navigated to "SHOWS" page 

Scenario: Navigation to bysport page in the submenu
  Given I'm on the videos page
  When I click on bysport tab
  Then I should be navigated to "BYSPORT" page        

Scenario: Verify the submenu in the videos page
  Given I'm on the videos page
  When I click on first video in the page 
  Then I should be redirected video playback page

Scenario: Verify the video controller options in the video player page
  Given I'm on the videos page
  When I click on first video in the page 
  Then I should validate the controller options   
