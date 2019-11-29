import 'package:clipboard_manager/clipboard_manager.dart';
import 'package:flutter/material.dart';
import 'package:new_year_sms/data.dart';
import 'package:share/share.dart';

class SMSPage extends StatefulWidget {
  SMSPage({Key key}) : super(key: key);

  @override
  _SMSPageState createState() => _SMSPageState();
}

class _SMSPageState extends State<SMSPage> {
  @override
  void initState() {
    super.initState();
    debugPrint("initState Called");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Year SMS"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: sms.length,
            itemBuilder: (context, index) =>
                Card(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(
                            sms[index],
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        Divider(),
                        Container(
                          child:Padding(
                            padding: const EdgeInsets.fromLTRB(10.0,0.0,10.0,10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                InkWell(child: Icon(Icons.content_copy),onTap: (){
                                  ClipboardManager.copyToClipBoard(sms[index]).then((result) {
                                    final snackBar = SnackBar(
                                      content: Text('Copied to Clipboard'),
                                      action: SnackBarAction(
                                        label: 'Undo',
                                        onPressed: () {

                                        },
                                      ),
                                    );
                                    Scaffold.of(context).showSnackBar(snackBar);
                                  });

                                },),
                                SizedBox(width: 10.0,),
                                InkWell(child: Icon(Icons.share),onTap: (){
                                  Share.share(sms[index],subject: "Share this SMS");
                                },),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          ),
        ),
      ),
    );
  }
}
