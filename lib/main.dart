import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(),
        '/some-page': (context) => ResultScreen(scannedCode: '123456'),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  String scannedData = '';
  final TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        scannedData = scanData.code ?? '';
      });

      if (scannedData == '123456') {
        Navigator.pushNamed(context, '/some-page');
      } else {
        _showErrorMessage('Código QR inválido.');
      }
    });
  }

  void _checkInputCode() {
    if (textController.text == '123456') {
      Navigator.pushNamed(context, '/some-page');
    } else {
      _showErrorMessage('El código ingresado es incorrecto.');
    }
  }

  void _showErrorMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR App'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: QRView(
                    key: qrKey,
                    onQRViewCreated: _onQRViewCreated,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Input número',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: _checkInputCode,
                  child: Text('Validar código'),
                ),
              ],
            ),
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: Colors.blue, width: 2)),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      controller?.resumeCamera();
                    },
                    child: Text('Reiniciar cámara', style: TextStyle(fontSize: 18)),
                  ),
                ),
                VerticalDivider(color: Colors.blue, width: 2),
                Expanded(
                  child: TextButton(
                    onPressed: () {
                      // Acción para el chat
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Chat', style: TextStyle(fontSize: 18)),
                        Icon(Icons.chat_bubble_outline),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final String scannedCode;

  ResultScreen({required this.scannedCode});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado Escaneado'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Código Escaneado:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              scannedCode,
              style: TextStyle(fontSize: 20, color: Colors.blue),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Volver'),
            ),
          ],
        ),
      ),
    );
  }
}
