Feature: EndtoEnd
  Background:
    *  configure driver = { type: 'chromedriver', executable: 'src/test/java/driver/chromedriver.exe' }
  Scenario: Spotify Login Faz2
    Given driver 'https://open.spotify.com/'
    When maximize()
    And waitFor("//button[@data-testid='login-button']").click()
    And delay(1000)
    And input('#login-username', 'furkan99ua@hotmail.com')
    And input('#login-password','Ff000099')
    And waitFor('#login-button').click()
    And click("//div[@class='JUa6JJNj7R_Y3i4P8YUX']/div[2]/div[11]/li/div[1]")
    #And click("//a[@class='standalone-ellipsis-one-line utSR0FVkHnII_aL8TOcu K8Rs3qAYirS8wJ1hR8gn']/span[contains(text(),'favs')]")
    And scroll('.Type__TypeElement-goli3j-0.hOGXfw')
    And mouse().move('.Svg-sc-1bi12j5-0.EQkJl.search-icon').click()
    * delay(2000)
    And input('.Type__TypeElement-goli3j-0.ebHsEf.QO9loc33XC50mMRUCIvf','That’s It')
    And mouse().move("//div[@class='pgwIORyBdf4nbb4G5_Jx']/div/button").click()
    * delay(5000)
    And waitFor('.T0anrkk_QA4IAQL29get.mYN_ST1TsDdC6q1k1_xs').click()
    * delay(2000)
    And mouse().move("//ul[@class='SboKmDrCTZng7t4EgNoM']/li[7]").click()
    * delay(4000)
    And waitFor("//button[@class='wC9sIed7pfp47wZbmU6m']//span[contains(text(),'mood')]").click()
    * delay(2000)

    And click("//span[text()='mood']")
    * delay(2000)

    Then print 'Test Sonlandı'


