import 'package:flutter/material.dart';

import 'package:smart_grab/shared_qrcode/main.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: 'Smart Grab',
    theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blue,
        canvasColor: Colors.white),
    routes: {
      '/': (context) => WelcomeScreen(),
      '/qrscan': (context) => Scoped(),
      '/about': (context) => AboutScreen()
    }
    );
  }
}

class AboutScreen extends StatelessWidget {
  static const double _horizontalPadding = 33;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom + 33,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: ButtonTheme(
                  minWidth: 0,
                  child: FlatButton(
                    padding: const EdgeInsets.all(0),
                    shape: null,
                    onPressed: () => Navigator.pop(context, null),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black12,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: _horizontalPadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 41),
                        const Text(
                          'Smart Grab',
                          style: TextStyle(
                              fontFamily: 'RobotoCondensedBold',
                              fontSize: 30,
                              letterSpacing: 5),
                        ),
                        const SizedBox(height: 12),
                        Container(
                          height: 2,
                          color: Colors.black.withOpacity(0.19),
                        ),
                        const SizedBox(height: 27),
                        Text(
                          'V 1.0'
                        )
                      ],
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

const double _horizontalPadding = 33;

class _WelcomeScreenState extends State<WelcomeScreen> {


  Future<void> _pressStartGame() async {
    await Navigator.of(context).pushNamed('/qrscan');
  }

  Future<void> _pressAbout() async {
    await Navigator.of(context).pushNamed('/about');
  }

  bool _initialized = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        alignment: Alignment.center,
          child: _WelcomeScreen(
            start: _pressStartGame,
            about: _pressAbout,
          ),
        ),
      );
  }
}

/// Builds the slim version of the welcome screen (usually shown
/// on portrait mobile devices).
class _WelcomeScreen extends StatelessWidget {
  final VoidCallback start;
  final VoidCallback about;
  const _WelcomeScreen({this.start, this.about});

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + 83,
          bottom: 56,
          left: _horizontalPadding,
          right: _horizontalPadding),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _Title(),
            Padding(
              padding: const EdgeInsets.only(top: 29, bottom: 15),
              child: RaisedButton(
                  child:Text('Start'),
                  onPressed: start),
            ),
            RaisedButton(
                  child: Text("About"),
                  onPressed: about,
                ),
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SMART GRAB\n USER APP',
              ),
            ],
          );
  }
}

