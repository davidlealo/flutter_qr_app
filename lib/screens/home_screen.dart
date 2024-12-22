import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Text(
                'cámara QR',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Input número',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/qr-scanner');
                    },
                    child: Text('Abrir cámara'),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
