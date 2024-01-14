# MenuMatch


## Link to Screenshots and Demo
https://duke.box.com/s/q94e23h3952otm3z5n46x1wwo671p70j

## Description


This is the app that every relationship needs! No longer will the question of “where do you want to eat?” cause issues and tension for no reason. This quick and easy game-like experience will help you choose the best restaurant based on your preferences. The user will choose a radius preference for the location of the restaurant, the pricing of the restaurant, and the lowest rating they wish the restaurant to have. After the user has selected these preferences, the app will begin the game. There will be 5 rounds that will show six restaurants in total. Each round will allow the user to view two restaurant profiles consisting of the restaurant’s location, photos, reviews, ratings, and a link to the restaurant’s website. The user will then tap their favorite restaurant from the two options. Then, a new restaurant competitor will appear in place of the restaurant that was not chosen. After the user has played all 5 rounds, they will have a winner! They will be able to add the restaurant “date” to their calendar. After they eat, they will be able to add the restaurant to their history and be able to add a photo to remember their experience. Within their history, they will be able to place pins of the restaurants they have been to on a map and see their restaurant tendencies and patterns with a fun chart visual. 


## iOS/API Technologies Used


- Maps: to find location of the restaurants, also to drop pins on restaurants that users have been to before
- API: use YELP API to find price, restaurant rating, type of food/restaurant, location, pictures, hours
- Photos: to add a photo/selfie to “history” to record all the restaurants you have visited (PhotosPicker)
- Chart: to keep track of your eating patterns (number of visits to restaurant, day you visit each restaurant, type of restaurant, etc.)


## Sources of Complexity and Difficulty
- The game itself: designing the ability to keep the restaurant that people want and placing the discarded one in a stack somewhere.
- Integration of both the API call and the maps features. Require expertise in designing API calls to seamlessly extract geographic information for display on the screen.
- Photo: Ensuring effective storage and proper display of image data.
