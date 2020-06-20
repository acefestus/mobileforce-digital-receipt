import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {runApp(MyApp()); }

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
            
        primaryColor: Colors.white,
      
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void customLaunch(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    } else {
      print(' could not launch $command');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar (),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            ListTile(
              onTap: () {
               aboutMyApp();
             },
              title: Text ('About'),
              
            )
          ],
        ),
      ),
      body: Center(
              
      ),
    );
  }
 aboutMyApp (){
   showAboutDialog(
                  context: context,
                  applicationIcon: FlutterLogo(),
                  applicationName: 'Reepcy',
                  applicationVersion: 'Version 1.0.0',
                  applicationLegalese:  '©2020 HNGi7',
                  children: <Widget>[
                    Text( 
                      'We would like to thank every partners that made it possible for the Digital Receipt App to be available.',
                      style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Montserrat',
                      fontSize: 10,
            ),
                    ),
                  
                  RaisedButton(
                  onPressed: () {
                    customLaunch('https://#');
                  },
                  child: Text('Terms of Service',
                      style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Montserrat',
                      fontSize: 10,
            )
            )
                ),

                   RaisedButton(
                     color: Color(0xffE5E5E5),
                  onPressed: () {
                    customLaunch('https://#');
                  },
                  child: Text('Privacy Policy',
                      style: TextStyle(
                      decoration: TextDecoration.none,
                      fontFamily: 'Montserrat',
                      fontSize: 10,
            )
            )
                ),               
                  
                 
                  ]
                 
                  );
 }   

               

}