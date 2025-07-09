/*
*   Main
*   @PARAM context,Password,ConfirmPassword
*   Description:
*       Exits if already the button pressed
*       Checks the fields whether valid or empty
*   RETURN (void);
* */
//TODO::
* find a fucking formula to adjust right reserved dynamically
* fix when edditing password the confirm password does not automatically notice
[21/6/2025] v2.3
    
    [General]
        BLoc files sturcture
    [ForgetPassword]
        bug fixes in UI and logic 

[21/6/2025] v2.3
    
    [General]
        files sturcture
        file names
    [ForgetPassword]
        bug fixes in 
                forget password screen
                OTP screen
                password reset screen
    
[21/6/2025] v2.3
    
    [Forget Password]
        fixed the logic for reseting password emails
        added an OTP via email with a resend timer
        implemented password reset with functionality (remainig validations)

[10/6/2025] v2.3

    moving to a new level of architect
        all libraries/packages now shall be exported inside -> includes file
        Moving Slowly from Material apps => CupertinoApp
        Fixing UI Small bugs/some enhancements
        Moving from PocketBase to SupaBase(PostgreSql)
        enhancing the usage of Public functions/variables
        components will be now each a file
        adding const where it should be for improving performance

[4/9/2025] v2.1
    
    done user profile screen

[3/9/2025] v2.1
    
    added Forget password reset with functionality
    made a more convenient way for invalid email

[3/8/2025] v2.1
    
    Finished Surveys with all functionallities and testings and savings to database

[3/1/2025] v2.1

    Added Surveys UI buttons and Quesitons

[2/26/2025] v2.0

    Components.dart => 
        Display error dialog message change from Internal Server error to Server Couldn't be reached
        Select Date Component changed the selected date color from teal to white-ish
    Create Account.dart => 
        Revert the UI to its original shape
        changed the SVG picutre
        added a responsive color for the password show/hide
    EmailVerification.dart =>
        added an openGmail Method
    EmailVerificationScreen.dart =>
        Fixed The Whole UI and Logic
        now it will check automaticly for user verification
    SignInScreen.dart =>
        Title is now bigger
        added circular progress loading on login
        added a responsive color for the password show/hide

[2/22/2025] v2.0

    added onTap Color for all TextButtons
    create a isKeyboardUp method in components
    Fixed the loading Button Size
    added loading button in createAccountScreen1
    fixed the card views display
    Footer Display on the bottom of screen
    Fixed some ui bugs(textSizes,Expanded, SafeAreas,button sizes, Title, Edit Icon size, Animation Duration, )
    

[2/22/2025] v2.0

    new UI implementation


[2/22/2025] v1.9

    email convert to lowecase
    Capitlize first and last name
    fixed bmi recalculation on weight change

[2/19/2025] v1.9
        
    cleared the authData values when user logsOut <Auth>
    More clear logs in  <authScreen> 
    All logical code shifted from Screen.Dart to Screenname.dart
    Fixed some validation display and footer display and display forget password <LogInUser>
    more features in EmailVerficationScreen and Fixed ResendVerification Button
     text buttons Color now is Primary

[2/18/2025] v1.8

    added auth key clear in login for safet
    added some usefully debugging prints
    isEmailVerified Method now works
    added DisplayError Function in component
    shifted EmailVerificationScreen and SignInScreen logic to name.dart files
    Fixed HomeScreen Avatar Image
    fix Gender section overflow
    fixed auth user reIdentification and validation

[2/17/2025] v1.7

    added user id to authData[] <.env>
    replace=> Regex Variables
    Replace=>Display Dialog Component
    Fix CreateAccountScreen Email Already Taken Validation
    Log In user After account Creation to save Credentials

[2/16/2025]

    did CreateAccountScreen Norm and Validation Fixes
    did CreateAccountScreen2 Validation Fixes
    CreateAccount logic file has now Select date function
    Display Dialog now is a component
    regex ,database url , and more variables for user data now is public <.env>

[2/14/2025]

    did home screen 
    profile screen 
    fixed default avatar image
    Made a new record table gender
    did email verification
    did logout and auto login after creation

[2/13/2025]

    did logout user and saving login credentials

[2/12/2025]

    done Login
    fixed some validations 
    UI fixes made the TextFields and Icons + SVG smaller
    fixed next button without validation
    fixed createAccount added a loading icon and a DialogBox for statusCode
    created account with encrypted passwords
    Account photo upload implementation 
    fixed goals font size

[2/11/2025]

    done create user account with PocketDb Connections 

[2/8/2025]

    done validations

[2/8/2025]

    done Create Account Screens

[2/8/2025]

    done user profile selector
    Appbad/Footer Components
    Fixed icons and create/signin Text Button overlay Color
    fixed java jdk shit