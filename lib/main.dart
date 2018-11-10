import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';


//Everything is under here!

//init stuff
final GoogleSignIn _googleSignIn = GoogleSignIn();
final FirebaseAuth _auth = FirebaseAuth.instance;
String userName;

bool isAuth = false;
bool isTapAuth = false;

Future<FirebaseUser> _handleSignIn() async {
  GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  isAuth = true;
  isTapAuth = true;
  FirebaseUser user = await _auth.signInWithGoogle(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  print("signed in " + user.displayName);
  userName = user.displayName;
  return user;
}

void main() {
  Widget whatHomeScreen;
  if (isAuth == true) {
    //good job the user logged in
    whatHomeScreen = MessageDisplay();
  } else {
    //get yo as to the login screen
    whatHomeScreen = FirstScreen();
  };
  runApp(MaterialApp(
    title: 'Student Messages Services',

    home: whatHomeScreen,
  ));
}


Future<FirebaseUser> _handleSignOut() async {
  GoogleSignInAccount googleUser = await _googleSignIn.signOut();
}


class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Messages Services'),
      ),
      body: Center(
        child:
        Column(
            children: <Widget>[
              Image.asset('assets/icon.png'),
              RaisedButton(
                color: Colors.redAccent,
                textColor: Colors.white,
                child: Text('Log in'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LogInScreen()),
                  );
                },
              ),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Sign Up'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpScreen()),
                  );
                },
              ),
            ]),
      ),
    );
  }
}

//custom made
class TextBoxer extends StatelessWidget {
  final String text;
  final TextEditingController controlFun;
  TextBoxer(this.text, this.controlFun);

  Widget build(context) {
    return new Container(
      margin: const EdgeInsets.all(10.0),
      width: 300,
      height: 40.0,
      child: TextField(
        autofocus: true,
          controller: controlFun,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: text
        ),
      ),
    );
  }
}

class LogInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Log In"),
        ),
        body:
        Column(
            children: <Widget>[
              new TextBoxer('Email or Phone', null), //replace null with the function u want to do
              new TextBoxer('Password', null),
              Center(
                child:
                RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text('Create Account'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessageDisplay()),
                    );
                  },
                )
                ,
              )
            ]
        ));
  }
}

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Sign Up"),
        ),
        body:
        Column(
            children: <Widget>[
              new TextBoxer('Phone or Number', null),
              new TextBoxer('Password', null),
              new TextBoxer('Confrim Password', null),
              Center(
                child:
                RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text('Signup With Google'),
                  onPressed: _handleSignIn,
                )
                  ,
              ),
              Center(
                child:
                RaisedButton(
                  color: Colors.blue,
                  textColor: Colors.white,
                  child: Text('Create Account'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectSchool()),
                    );
                  },
                )
                ,
              )
            ]
        ));
  }
}


class SelectSchool extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select a School"),
        ),
        body:
        Padding(
          padding: EdgeInsets.all(20.0),
          child:
          Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 1,
                      groupValue: 2,
                      onChanged: (int) {},
                    ),
                    new Text(
                      'South Brunswick Highschool',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 0,
                      groupValue: 2,
                      onChanged: (int) {},
                    ),
                    new Text(
                      'Princeton Highschool',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Row(
                  children: <Widget>[
                    new Radio(
                      value: 0,
                      groupValue: 2,
                      onChanged: (int) {},
                    ),
                    new Text(
                      'Crossroads North Middleschool',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                RaisedButton(
                  color: Colors.redAccent,
                  textColor: Colors.white,
                  child: Text('Next'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SelectClasses()),
                    );
                  },
                )
              ]
          ),));
  }
}

//custom made
class ClassBox extends StatelessWidget {
  final String classSpot;

  ClassBox(this.classSpot);

  Widget build(context) {
    return new   Container(
      margin: const EdgeInsets.all(10.0),
      width: 150,
      height: 40.0,
      child: TextField(
        autofocus: true,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: classSpot
        ),
      ),
    );
  }
}


class SelectClasses extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Log In"),
      ),
      body:
      Container(
          margin: const EdgeInsets.all(30.0),
          child:
          Column(
            children: <Widget>[
              Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 150,
                            height: 40,
                            child:
                            Text('A day',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                        ),
                        Container(
                            margin: const EdgeInsets.all(10.0),
                            width: 150,
                            height: 40.0,
                            child:
                            Text('B day',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            )
                        ),
                      ],
                    ),
                  ]),
              Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        ClassBox('Block 1'),
                        ClassBox('Block 1'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        ClassBox('Block 2'),
                        ClassBox('Block 2'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        ClassBox('Block 3'),
                        ClassBox('Block 3'),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        ClassBox('Block 4'),
                        ClassBox('Block 4'),
                      ],
                    ),
                  ]),
              RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Next'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MessageDisplay()),
                  );
                },
              )
            ],
          )
      ),
    );
  }
}


class MessageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Messages')),
      body: Center(child: Text('Page Loaded. But its still being built.')),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the Drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(userName),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Sign Out'),
              onTap: _handleSignOut,
            ),
          ],
        ),
      ),
    );
  }
}