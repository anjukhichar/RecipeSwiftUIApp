Steps to Run the App

    Prerequisites:
    Xcode 12+ (recommended)
    Swift 5+
    Internet access to fetch data from the API
    
    Steps:
    Clone the repository:
    git clone https://github.com/anjukhichar/RecipeSwiftUIApp
    
    Open the project:
    Navigate to the project directory and open the .xcodeproj file in Xcode.
    
    Install dependencies:
    The project uses Kingfisher for image caching. Make sure you have it installed through Swift Package Manager. If not, go to:
    File > Swift Packages > Add Package Dependency, and use https://github.com/onevcat/Kingfisher.
    
    Build the app:
    In Xcode, click the Build button or use the shortcut Cmd + B.
    
    Run the app:
    Select your target device (simulator or actual device) and click Run or use the shortcut Cmd + R.

    Run unit tests:
    Go to Product > Test or use the shortcut Cmd + U to run unit tests for RecipeService.


Focus Areas

    1. Concurrency Management with Actors
    Reason: With Swift’s new concurrency model, managing state safely in a multi-threaded environment is crucial. Actors provide a powerful mechanism to ensure thread-safe, concurrent access to shared resources.
    Goal: Ensure that data fetching and state updates are handled asynchronously and without race conditions.
    
    2. Image Caching
    Reason: Loading images directly from URLs can be slow and inefficient if done repeatedly. Image caching helps improve performance and reduces unnecessary network requests.
    Goal: Cache images efficiently with Kingfisher, ensuring a smooth user experience, even with slow or intermittent network connections.
    
    3. Testing
    Reason: Ensuring that the core functionality (fetching recipes from an API) works correctly in both success and failure scenarios is essential for a reliable app.
    Goal: Write comprehensive unit tests to validate network requests and error handling in RecipeService.
    
    4. User Experience with Pull-to-Refresh:
    To provide a modern and intuitive user experience, pull-to-refresh functionality was added to allow users to manually refresh the recipes displayed.
    
Time Spent

    Total Time: Approximately 4 hours
    
    Setting up the project (15 min):
    Created SwiftUI project, integrated Kingfisher, and set up the basic project structure.

    API integration & Model Setup (45 min):
    Built the model (Recipe), set up the RecipeService actor, and handled JSON decoding and API error handling.

    Concurrency Management (0.5 hour):
    Used Swift’s concurrency features like async/await and Actors to manage API requests.

    UI Development with SwiftUI (45 min):
    Developed the recipe list UI using SwiftUI, including the integration of Kingfisher for image loading.
    Added pull-to-refresh functionality to refresh the recipes list manually.

    Writing Unit Tests (1 hour):
    Developed unit tests for RecipeService, covering both success and failure scenarios.

    Final Touches & Documentation (45 min):
    Added comments, wrote the README, and cleaned up the code for clarity and maintainability.


Trade-offs and Decisions

    1. API Key Hardcoding:
    I hardcoded the urlString within the RecipeService.swift file. For a production environment, I would store it securely using environment variables or a keychain, but to simplify the setup, I hardcoded it here.

    2. No Custom Image Cache:
    Instead of building a custom image caching solution, I opted to use Kingfisher. While it provides great performance, using an external dependency adds a bit of overhead to the project. I decided this was a reasonable trade-off to prioritize performance and simplicity.

    3. Focus on Core Functionality:
    I decided to focus more on ensuring the app correctly fetches, decodes, and displays data rather than adding additional features like search or filtering. The core functionality provides a stable foundation for future enhancements.


Weakest Part of the Project

    The weakest part of the project is error handling in the UI. Although network errors are handled in the code, the user is not informed if something goes wrong during the recipe fetching process. Ideally, a user-friendly error message or retry option should be implemented to improve user experience when network requests fail.


External Code and Dependencies

    1. Kingfisher
        For image downloading and caching.
        URL: https://github.com/onevcat/Kingfisher.
    
    2. Swift’s Concurrency Model
        Leveraged async/await and Actors to handle concurrency and avoid threading issues in network requests.

    3. URLSession
        Used for making network requests to the recipe API.
        
        
Additional Information

    Improvements for Production:
    Better error handling for failed network requests, including UI feedback (e.g., alerts or banners).
    Pagination could be added if the API returns more results than can be displayed on one page.
    API key security should be enhanced by moving it out of the source code into a secure vault or configuration system.
    
    Scalability:
    The app is designed to be easily extendable with features like filtering, searching recipes, or showing detailed recipe views.
    
    
I encountered no major blockers, but understanding how to properly manage state and concurrency with Swift's Actors and async/await required careful thought, particularly in the context of handling UI updates efficiently.













