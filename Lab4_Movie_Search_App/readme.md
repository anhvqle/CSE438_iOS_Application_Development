# Creative Portions #

## What I Implemented ##
1. Watch movie's trailer on YouTube: I implemented the functionality to let user access YouTube for specific's movie trailer videos. Before deciding to add the movie to his/her favorite list, the user has the option to watch the movie's trailer. 
2. When the app launches, popular movies with the most votes are shown to the main page as the starting menu.
3. Detailed View of each movies in the user's Favorite list is accessible from Favorite View. 
4. A clear button to remove user's current favorite list. 

## How I implemented it ##
1. For the movie trailer option, I added an UIButton that sends the movie's title name and embedded it as an URLRequest to a WebViewController that implements WebKit WKNNavigationDelegate. A WKWebView, that links to YouTube, was created on top of the navigation stack. 
2. For the starting menu, I set up a collection view for the top most popular movies and send a JSON URL to the TMDB website to fetch data back. I added all the images into an array of UIImage for display. 
3. I had to push a detailed view controller on top of the favorite view controller to show the movie's details. However, I had trouble with passing the UIImage between views. And my solution for this problem is to send poster paths between views and retrieve the actually image from the database before embedding it onto the Detailed View.
3. I simply empty all the UserDefaults databases that have information with regards to the movies' details in the user's favorite list. The list is clear only when the user clicks the button


## Why I implemented it ##
1. When it comes to movies, it is a must for users to have access to every movie's trailer video. Therefore, I believe one simple functionality is to give users the option to watch those trailer videos on YouTube before deciding to add them to their favorite list or not. 
2. I implemented this functionality because when the app launches, it looks kind of boring since it is only a blank white page. Users might be confused that the app is not even working even though it only works when the User types in a movie name to search for. Top movies of all time should be on the front page's display. 
3. Users should be able to read the details of their favorite movies in the list. When I first tested the application with base requirements, it bothered me that I cannot click on a movie's name in the favorite list to show its details. Therefore, I believe this functionality is very helpful.
4. Some user might add a lot of favorite movies inside their list so it might be a small helpful option to delete the whole list instead of going through each movie to delete individually. 
