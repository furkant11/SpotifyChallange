package examples.users;

import com.intuit.karate.junit5.Karate;

class SpotifyRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("Spotify").relativeTo(getClass());
    }
}