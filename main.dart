import 'package:flutter/material.dart';

void main() {
  runApp(TimerApp());
}

class TimerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: TimerHomePage());
  }
}

class TimerHomePage extends StatefulWidget {
  @override
  _TimerHomePageState createState() => _TimerHomePageState();
}

class _TimerHomePageState extends State<TimerHomePage> {
  int _timeLeft = 10; // starting countdown time in seconds
  bool _isRunning = false;

  void startTimer() async {
    if (_isRunning) return;
    setState(() {
      _isRunning = true;
      _timeLeft = 10; // reset timer
    });

    while (_timeLeft > 0) {
      await Future.delayed(Duration(seconds: 1));
      if (!mounted) return;
      setState(() {
        _timeLeft--;
      });
    }

    setState(() {
      _isRunning = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Countdown Timer')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('$_timeLeft', style: TextStyle(fontSize: 60)),
            SizedBox(height: 20),
            ElevatedButton(onPressed: startTimer, child: Text('Start Timer')),
          ],
        ),
      ),
    );
  }
}
