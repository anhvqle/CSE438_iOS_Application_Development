![](Lab1-Demo.png)

Creative Portions: Implement Calculator Buttons for User instead of using keyboards to type inputs

1. What I Implemented
- I implemented number buttons as well as DEL and AC buttons on screen to provide users with interactive features to deploy on an actual iPhones without having to use the laptop keyboards to type in the original price, discount, or sales tax. To use the buttons, the users have to select a field and then just simply type in whatever number they want. With that said, this does not eliminate the keyboards. The app is still running perfectly fine with a combination of screen buttons and keyboard inputs. This on-screen calculator should be easy to use and navigate. Note that you cannot enter a value higher than 100 for the discount percentage; any discount value higher than 100 will automatically be set to 100. 

2. How I implemented it: 
- First, I set a cursor variable for each text input field. My calculator function first checks which text input the user is currently on and decides to change the input field accordingly. Buttons are given tags that are used as their values. The DEL button removes the last digit of the field, while the AC clears the whole input field. All buttons have the Touch Up Inside event inside the calculator function. Moreover, when user tries to input anything that is not a number from the computer's keyboards, all fields will be set to empty and the final price is set at $0.00. The on-screen calculator is very simple and should be easy to use for everyone. 

3. Why I implemented it:
- Since the app is supposed to serve iPhone users, not Mac users. Therefore, I believe that the users should have the ability to enter inputs without the help of a keyboard. For next steps of the project, I would implement mathematical buttons as well to perform addition, subtraction, multiplication, and division. For example, users may want to input multiple origin price without having to do math in their head before entering the total original price. 

**Note: The App also works in Spanish after localization**
