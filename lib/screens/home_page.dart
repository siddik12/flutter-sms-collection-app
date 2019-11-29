import 'package:flutter/material.dart';
import 'package:new_year_sms/sms-page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bangla SMS 2020"),
      ),
      body: ListView(
        children: <Widget>[
          RaisedButton(
            child: Text("All SMS Collection"),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => SMSPage()
              ));
            },
          ),
          RaisedButton(
            child: Text("Share This App"),
            onPressed: (){},
          ),
        ],
      ),
    );
  }
}
