# firebase_email_signin

- Google Firebase Facebook Login in Flutter. 

## Introduction:

- Google firebase is trending nowadays. Google firebase has around 10 signin methods which includes email, google, facebook, phone, twitter, yahoo etc login. We had covered Email/Password and Gmail Login in another article, if you want to know more about it then you can check  https://github.com/myvsparth/firebase_email_signin. We are covering facebook login in this article. Now, we are going step by step. I have given git repository link in the bottom as well.

## Steps:
1.  First and basic step to create new application in flutter. If you are a beginner in flutter then you can check my blog Create a first app in Flutter. I have created app named as “flutter_fb_login”
2.  For Facebook Login in Flutte you need to create Facebook App in Facebook Developer Console. For that follow below steps.
    -   Go to https://developers.facebook.com/ and login using your facebook account or create a new one.
    -   Then create new App using MyApp => Create App and Give the app name and create the app. Check out the below screenshot.

 
    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/1.png)

    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/2.png)

    -   After Creating App click on Integrate Facebook Login and confirm.
    -   Then Go to Dashboard Tab go to under My Products you will find Facebook Login=>Settings(Click on that).
    -   Then you will find in Left tab QuickStart Under Facebook Login Menu Click on it.
    -   Then Click on Android check out the screenshot.

    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/3.png)
 
    -   Then in Step 1 Click Next, Step 2 Click Next then in Step 3: Tell Us about Your Android Project Give Package Name and Default Activity Class Name as I have given in below screenshot. And Save => Use This Package => Continue

    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/4.png)
        Package Name: com.example.flutter_fb_login
        Default Activity: com.example.flutter_fb_login.MainActivity

    -   In Step 4:Add Your Development and Release Key Hashes follow mac or windows as per your OS and enter hashkey. Please Note that default android keystore password is android. Copy has key and Paste there and Save => Continue.
    -   Step5 click Next. 
    -   In Step 6 you need to put a lot of stuff in your app.
        -   Goto your project android/app/src/main/res/values under values folder create new file strings.xml and put below string( you have in your facebook project ) in this file

        ```
        <?xml version="1.0" encoding="utf-8"?>
        <resources>
        <string name="app_name">flutter_login</string>
        <string name="facebook_app_id">2432431656989926</string>
        <string name="fb_login_protocol_scheme">fb2432431656989926</string>
        </resources>
        ```
        
        -   Then goto android/app/src/main/AndroidManifest.xml and paste below code ( you have in your facebook project ) under first activity and in application tag. Please check the screenshot.

        ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/5.png)

        -   Next for all next steps.
        -   You are all done with Facebook App Setup. Congratulations…. :)

3.  Now, You need to setup a project in Google Firebase. Follow below steps for that. Please follow the step very carefully.
    -   Goto https://console.firebase.google.com/ and add new project. I will share screenshot how it looks so you will get a better idea.
    -   Click on Add Project to add new project in Google Firebase. Then you will find below form

    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/6.png)
    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/7.png)

    -   Give a project name and accept the terms and condition and click on the Create Project. It will take some time to create a new project and redirect you to project overview page.

    -   Now, you need to add android app in this project [Please check below screenshot]. You can add new android project from clicking on android icon. You can also add ios project if you want to create ios application for the same.

    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/8.png)

    -   In Project Overview add android app for that click on the android icon. It will open new form please check below screenshot.

    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/9.png)

    -   Android package name you will find in the AndroidManifest.xml file in the Android => App => main folder of your project.
    -   App nickname is optional
    -   For SHA-1 generation goto https://developers.google.com/android/guides/client-auth

    -   In step 2 download google-service.json and put in android => App folder of your project
    -   In step 3 you can see you need to configure some dependencies
        -   Project-level build.gradle (<project>/build.gradle): means build.gradle file in Android folder directly
        ```
        buildscript {
        dependencies {
            // Add this line
            classpath 'com.google.gms:google-services:4.2.0'    
        }
        ```
        -   App-level build.gradle (<project>/<app-module>/build.gradle): means build.gradle file in Android = > App folder
        // Add to the bottom of the file
        ```
        apply plugin: 'com.google.gms.google-services’
        ```
    -   In Step 4 It will try to verify your app. For that you need to run your app once or you can skip this step.
    -   Hurrey :) your android app has been created.

4.  Now, you need to enable Facebook Sign In method in firebase. For that you need to go to the Authentication tab and then Signin method tab. From there enable Facebook sign in method. Please check the screenshot.
    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/10.png)

    -   You need App ID and App secret get that from Your Facebook App that we have created in previous steps. You will get App Id and secret From Settings => Basic. Check the below screenshot. Note: Click on Show App Secrete to Copy

    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/11.png)

    -   Copy Oauth redirect from Firebase App and paste in Facebook App Facebook Login=>Settings Valid OAuth Redirect URIs. Please check below screenshot

    Copy From Firebase App
    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/12.png)

    Paste in Facebook App (Login=>Settings Valid OAuth Redirect URIs)
    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/13.png)

    -   You are all done with firebase Setup. Congratulations…. :)

5.  Get back to the project and Open pubspec.yaml file in the root of the project. Pubspec.yaml is used to define all the dependencies and assets of the project.

    -   Add below dependencies and save the file
    ```
    firebase_auth:
    flutter_facebook_login:
    ```
    -   Please check below screenshot you will get more idea where to add the dependency
    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/14.png)

    -   Run flutter packages get in terminal OR If you are using Visual Studio Code then after saving file it will automatically runs the flutter packages get command.

    -   Now, we are done with all dependency setup at project side as well…. :)

6.  Now, we need to programmatically handle facebook login in google firebase. For that we create 1 page login_page.dart. I have attached a link of git repo in the bottom of the article, you can take reference from there. Here I will just define main logic of facebook login and logout.

    ```
    import 'package:firebase_auth/firebase_auth.dart';
    import 'package:flutter_facebook_login/flutter_facebook_login.dart';
    ```

    -   Login using Facebook:
    ```
    Future<FirebaseUser> facebookLogin(BuildContext context) async {
        FirebaseUser currentUser;
        // fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
        // if you remove above comment then facebook login will take username and pasword for login in Webview
        try {
            final FacebookLoginResult facebookLoginResult =
                await fbLogin.logInWithReadPermissions(['email', 'public_profile']);
            if (facebookLoginResult.status == FacebookLoginStatus.loggedIn) {
            FacebookAccessToken facebookAccessToken =
                facebookLoginResult.accessToken;
            final AuthCredential credential = FacebookAuthProvider.getCredential(
                accessToken: facebookAccessToken.token);
            final FirebaseUser user = await auth.signInWithCredential(credential);
            assert(user.email != null);
            assert(user.displayName != null);
            assert(!user.isAnonymous);
            assert(await user.getIdToken() != null);
            currentUser = await auth.currentUser();
            assert(user.uid == currentUser.uid);
            return currentUser;
            
        } catch (e) {
            print(e);
        }
        return currentUser;
    }    
    ```

    -   Logout From Facebook:
    ```
    Future<bool> facebookLoginout() async {
        await auth.signOut();
        await fbLogin.logOut();
        return true;
    }
    ```

7.  When you sign up successfully you can check that google firebase store the user detail in server. Please check the screenshot.
    ![alt text](https://raw.githubusercontent.com/myvsparth/flutter_fb_login/master/screenshots/15.png)

## MAY BE ERRORS:
    #   Error: import androidx.annotation.NonNull;
    #   Solution : 
        Put android.useAndroidX=true
        android.enableJetifier=true
        In android/gradle.properties file


## NOTE:
-   I HAVE COMMENTED ONE LINE IN FACEBOOK SIGNIN METHOD ALSO TRY THAT BY UNCOMMENTING IT
    ```
    fbLogin.loginBehavior = FacebookLoginBehavior.webViewOnly;
    ```
-   THERE WILL BE an UPGRADE IN ANY PLUGIN LIKE firebase_auth OR flutter_facebook_login SO IF YOU FIND ERROR WHILE LOGIN. PLEASE ALSO REFER IT’S OFFICIAL DOCUMENTATION.
-   PLEASE CHECK OUT GIT REPO FOR FULL SOURCE CODE. YOU NEED TO ADD YOUR google-services.json FILE IN ANDROID => APP FOLDER. AND ALSO REPLACE android/app/src/main/res/values/strings.xml WITH YOUR FACEBOOK APP NAME, APP ID AND SECRET.

## Git Repo:
-   https://github.com/myvsparth/flutter_fb_login

## Conclusion:
- Google firebase is very good service provider in terms of data validation, data store, realtime data, push notification. We have only used google firebase facebook sign in feature. We can do more out of it.


For help getting started with Flutter, view 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
