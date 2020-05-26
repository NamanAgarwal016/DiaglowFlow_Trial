import 'package:flutter/material.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
//import io.flutter.app.FlutterActivity;
//import io.flutter.embedding.android.FlutterActivity;

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  void response(query) async{
    AuthGoogle authGoogle = await AuthGoogle(fileJson: "assets/chatbot-aqqlri-a253e69530c0.json")
        .build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: Language.english);
    print("hello there");

    AIResponse aiResponse = await dialogflow.detectIntent(query);
    print(aiResponse.getListMessage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cupcake Shop Bot"
        ),
        backgroundColor: Colors.deepOrange,
      ),

      body: Container(
        child: Center(
          child: RaisedButton(onPressed: (){
            response("hello");
            print("Naman");
          }, child: Text("response"),),
        ),
      ),
    );
  }
}
