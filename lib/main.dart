import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

//Everything is under here!

void main() {
  runApp(MaterialApp(
    title: 'Student Messages Services',
    home: FirstScreen(),
  ));
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

  TextBoxer(this.text);

  Widget build(context) {
    return new Container(
      margin: const EdgeInsets.all(10.0),
      width: 300,
      height: 40.0,
      child: TextField(
        autofocus: true,
          //controller: ,
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
              new TextBoxer('Email or Phone'), //to get the values these you will need to paste TextBoxer class code and uncomment the controller
              new TextBoxer('Password'),// I did this so its more readable at first site
              Center(
                child:
                RaisedButton(
                  color: Colors.redAccent,
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
              new TextBoxer('Phone or Number'),
              new TextBoxer('Password'),
              new TextBoxer('Confrim Password'),
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
      appBar: AppBar(
        title: Text('Student Messages Services'),
      ),
      body: Center(
          child:
          Text('Screen Loaded, This page is in progress')
      ),
    );
  }
}