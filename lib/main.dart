import 'package:flutter/material.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NFC Sender',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _nfcStatus = "Not transmitted";

  _sendNFCData() async {
    final status = await FlutterNfcKit.nfcAvailability;
    if (status == NFCAvailability.available) {
      // TODO: Transmit data to NFC (requires platform-specific implementation)
      // For simplicity, this just updates the UI state.
      setState(() {
        _nfcStatus = "Transmitted 123 UID";
      });
    } else {
      setState(() {
        _nfcStatus = "NFC not available";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('NFC Sender')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('NFC Status: $_nfcStatus'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendNFCData,
              child: const Text('Send 123 UID to NFC'),
            ),
          ],
        ),
      ),
    );
  }
}
