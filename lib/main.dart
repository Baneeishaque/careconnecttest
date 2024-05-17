import 'package:flutter/material.dart';
import 'package:okk/background_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeService();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final Screen _screen = Screen();
  String _screenLockTimes = 'Unknown';

  @override
  void initState() {
    super.initState();
    // _screen.screenStateStream!.listen(
    //   (event) {
    //     print(event);
    //   },
    // );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen Lock/Unlock Times'),
      ),
      body: Center(
        child: Text(_screenLockTimes),
      ),
    );
  }
}
