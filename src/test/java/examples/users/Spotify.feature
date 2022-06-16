Feature: sample karate test script

  Background:
    *  configure driver = { type: 'chromedriver', executable: 'src/test/java/driver/chromedriver.exe' }

  Scenario: Spotify Login
    Given driver 'https://open.spotify.com/'
    When maximize()
    And waitFor("//button[@data-testid='login-button']").click()
    And delay(1000)
    And input('#login-username', 'furkan99ua@hotmail.com')
    And input('#login-password','Ff000099')
    And waitFor('#login-button').click()
    And waitFor("//button[@data-testid='create-playlist-button']").click()
    And waitFor('.Type__TypeElement-goli3j-0.hVBZRJ').click()
    And input("//input[@data-testid='playlist-edit-details-name-input']",'MentorLabs Challenge')
    And waitFor('.Button-qlcn5g-0.jvEinx').click()
    And input('.Type__TypeElement-goli3j-0.ebHsEf.l42JW4EP_5CU1Ba7jYIc','Daft Punk')
    And waitFor("//button[@data-testid='add-to-playlist-button']").click()
    Then waitFor("//div[contains(text(),'Çalma Listesine eklendi')]")
