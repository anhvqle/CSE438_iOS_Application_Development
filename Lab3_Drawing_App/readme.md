# Creative Portions: Coloring Pictures & Saving the drawing to Photos Library #

## What I Implemented ##
1. I implemented some pre-made coloring pictures for younger users to use the app as a coloring app instead of just simple drawing.
2. I implemented another button on the navigation bar that would allow users to save their drawings to the local Photos App. It saves the drawing rather than "screenshooting the screen". 

## How I implemented it ##
1. For the coloring images, they are stored in an array of UIImage called coloringPictures. Each picture is an UIButton with different keys. The coloringPic function will change the UIImageView to whichever user chooses accord to the buttons' tag numbers. The last button is an option to draw without a picture, which set the UIImage to nil
2. For the drawing saving functionality, I had to add the NSPhotoLibraryAddUsageDescription key to the project's plist file to allow the application to write photos on the simulator phone to save screenshots. Then, I created a button called "Save" that calls the screenshot function. This screenshot function get the graphics of the drawing view except navigation bar and color buttons. Then the content of this graphics is stored as an image after rendering. Lastly, the function writes the saved image to the user's Photos Application and shows an alert message that the drawing is saved successfully. I used the code from 2 stackoverflow posts (cited below) to help with this functionality.

## Why I implemented it ##
1. Some coloring pictures may make the application appealing to kids since simple drawing might be boring. Younger users will spend more time if they are trying to finish a black and white picture, rather than just drawing simple things on a white screen.
2. This application can be considered a note taker app with drawings and writings. Therefore, having the ability to save the drawings only must be helpful without having to manually press home and volumn buttons to save a screenshot of the whole screen.
