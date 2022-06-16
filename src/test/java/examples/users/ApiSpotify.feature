Feature: fkfkfk
  Background:
    * def userID = 'furkantopkan'
    * def token = 'BQA7i90xbsjECgN_5_ZN5fQaBer6FG8O3PAJ64rDUc2VXvRD-b4aOUrLkuoQykaVFvnMiW9sokSYOfJrz_GE3tVlF8_qBYPGevyDE_l8zK9BNrbdDne3JGifhHp8KB5kwD82J5vFYSmjdbzo64NqMgVfMk9Kt3gefaY4L-yOkBGboaLoXB11qgztA0mXf31_-SjGTwz30_MlRmY_U_dnY3I3jkO-TLPt_10zislGNHZcMZ1w_cVdRTEmi6ujXg'

* def getRequestBody =
    """
    {
  "name": "Mentorlabs Challenge",
  "description": "New playlist description",
  "public": false
}
    """


  Scenario: Get User
    Given url 'https://api.spotify.com/v1'
    And path '/me'
    And header Authorization = 'Bearer ' +token
    When method get

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
    And param q = 'Bohemian Rhapsody'
    And param type = 'track'
    When method get


    * def playlistUri = response.tracks.items[8].uri
    And def getRequest = {uris:[#(playlistUri)]}
    And url 'https://api.spotify.com/v1'
    And path '/playlists/'+playlist_id+'/tracks'
    And header Authorization = 'Bearer ' +token
    And header Content-Type = 'application/json'
    And request getRequest
    When method post
