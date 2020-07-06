import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  final Function getData;

  ErrorScreen(this.getData);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Something went wrong',style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Text('Give it another try', style: TextStyle(
                    color: Colors.grey.shade600
                ),),
                FlatButton(
                  onPressed: getData,
                  child: Text('RELOAD'),
                  textColor: Colors.blue,
                ),
              ],
            ),
          ),
        ));
  }
}