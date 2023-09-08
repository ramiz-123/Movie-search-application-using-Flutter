# Movie-search-application-using-Flutter
Step 1: Set Up Flutter Project

Create a new Flutter project using Flutter CLI or your preferred development environment. Make sure you have Flutter and Dart installed.
Step 2: Add Dependencies

In your pubspec.yaml file, add the following dependencies
Run flutter pub get to install these dependencies.

Step 3: Fetch Movie Data

You can use a movie API like The Movie Database (TMDb) to fetch movie data. You'll need to sign up for a free API key on their website (https://www.themoviedb.org/documentation/api) and use it in your app.

Create a services folder and add a movie_service.dart file to handle API requests. Here's a simplified example:
Step 4: Create the Homepage

Design your homepage to display the top-rated movies. Create a models folder and define a Movie class to represent movie data
Now, create the homepage with a list of top-rated movies:
