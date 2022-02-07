import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/rendering.dart';
FirebaseMessaging messaging = FirebaseMessaging.instance;
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // FirebaseMessaging.onBackgroundMessage((message) => _firebaseMessagingBackgroundHandler(message) );
  foreground();
  opendApp();
  runApp(MyApp());} 

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  background();
   print(message.notification.title );
}

background(){
 print("===| background |==="); 
 
}

foreground(){
FirebaseMessaging.onMessage.listen((event) {
  print("====| foreground |===");
});
}

opendApp(){
FirebaseMessaging.onMessageOpenedApp.listen((event) {
  print("====| opendApp |===");
});
}

getToken() async {
 var token = await messaging.getToken();
 print("====| token |===");
 print(token);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){getToken();}, ),
      ),
    );
  }
}