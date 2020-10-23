# Creative Portions: Saving the current drawing to the photos library #

## What I Implemented ##
- I implemented another button on the navigation bar that would allow users to save their drawings to the local Photos App. It saves the drawing rather than "screenshooting the screen"

## How I implemented it ##
- First, I had to add the NSPhotoLibraryAddUsageDescription key to the project's plist file to allow the application to write photos on the simulator phone to save screenshots. Then, I created a button called "Save" that calls the screenshot function. This screenshot function get the graphics of the drawing view except navigation bar and color buttons. Then the content of this graphics is stored as an image after rendering. Lastly, the function writes the saved image to the user's Photos Application.

## Why I implemented it ##
- This application can be considered a note taker app with drawings and writings. Therefore, having the ability to save the drawings only must be 