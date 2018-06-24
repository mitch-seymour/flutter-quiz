import "package:flutter/material.dart";

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      color: Colors.greenAccent,
      child: new InkWell(
        onTap: () => print("we tapped the page"),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text("Let's quiz", style: new TextStyle(color: Colors.white, fontSize: 50.0)),
            new Text("Tap to start!", style: new TextStyle(color: Colors.white, fontSize: 30.0))
          ]
        )
      )
    );
  }
}