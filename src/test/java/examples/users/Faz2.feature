Feature: faz2 karate

  Background:
    *  configure driver = { type: 'chromedriver', executable: 'src/test/java/driver/chromedriver.exe' }
    * def userID = 'furkantopkan'
    * def token = 'BQCFWLVvKsN3EedLAu6_Y8QB3Arejo1tmsqKr4nPO8oCIeKUAS3hhKogxNSuATw9RWDrnjPrNgbgfwaqpB27w76IzeaRwe7EzusUbZ5x9Zk45SHKuNn7Z_-dOSjGl7fgAOqjJtaeqf1OvSXCIT8niETSQ0cRAoUsc7VEfXchwLYNnDUwhhvuCj80rC5LgnUO1mFa1pxTVsRKicwIdsBdLXoQkkHNec7s7Vtjgq27yNPryEcK8PIvqp0IxTKVhJE'
    * def getRequestBody =

    """
    {
  "name": "Mentorlabs Faz2",
  "description": "New playlist description",
  "public": false
}
    """
  Scenario: Spotify Login Faz2
    Given driver 'https://open.spotify.com/'
    When maximize()
    And waitFor("//button[@data-testid='login-button']").click()
    And delay(1000)
    And input('#login-username', 'furkan99ua@hotmail.com')
    And input('#login-password','Ff000099')
    And waitFor('#login-button').click()

    And url 'https://api.spotify.com/v1'
    And path '/users/'+userID+'/playlists'
    And header Authorization = 'Bearer ' +token
    And header 'Content-Type = 'application/json'
    And request getRequestBody
    When method post
    * def playlist_id = response.id

    And url 'https://api.spotify.com/v1'
    And path '/search'
    And header Authorization = 'Bearer ' +token
    And header 'Content-Type' = 'application/json'
    And param q = 'The Final Countdown'
    And param type = 'track'
    When method get


    * def playlistUri = response.tracks.items[0].uri
    And def getRequest = {uris:[#(playlistUri)]}
    And url 'https://api.spotify.com/v1'
    And path '/playlists/'+playlist_id+'/tracks'
    And header Authorization = 'Bearer ' +token
    And header Content-Type = 'application/json'
    And request getRequest
    When method post


    And waitFor("//div[@class='AINMAUImkAYJd4ertQxy'][1]").click()
    And click('.ButtonInner-sc-14ud5tc-0.gHYQaG.encore-bright-accent-set')
    * delay(10000)
    And url 'https://api.spotify.com'
    And path 'v1/me/player/currently-playing'
    And header Authorization = 'Bearer ' +token
    And method get
    * def songControl = karate.jsonPath(response,"$.['item'].['name']")
    Then match songControl == 'The Final Countdown'