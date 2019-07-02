import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FacebookLogin fbLogin = new FacebookLogin();
  bool isFacebookLoginIn = false;
  String errorMessage = '';
  String successMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Email Login'),
      ),
      body: Center(
          child: Column(
        children: [
          (!isFacebookLoginIn
              ? RaisedButton(
                  child: Text('Facebook Login'),
                  onPressed: () {
                    facebookLogin(context).then((user) {
                      if (user != null) {
                        print('Logged in successfully.');
                        setState(() {
                          isFacebookLoginIn = true;
                          successMessage =
                              'Logged in successfully.\nEmail : ${user.email}\nYou can now navigate to Home Page.';
                        });
                      } else {
                        print('Error while Login.');
                      }
                    });
                  },
                )
              : RaisedButton(
                  child: Text('Facebook Logout'),
                  onPressed: () {
                    facebookLoginout().then((response) {
                      if (response) {
                        setState(() {
                          isFacebookLoginIn = false;
                          successMessage = '';
                        });
                      }
                    });
                  },
                )),
        ],
      )),
    );
  }

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
      }
    } catch (e) {
      print(e);
    }
    return currentUser;
  }

  Future<bool> facebookLoginout() async {
    await auth.signOut();
    await fbLogin.logOut();
    return true;
  }
}
