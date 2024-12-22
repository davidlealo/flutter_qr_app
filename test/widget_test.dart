import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_qr_app/main.dart';

void main() {
  testWidgets('Navigation to QR Scanner works', (WidgetTester tester) async {
    // Construye la app y activa un fotograma.
    await tester.pumpWidget(MyApp());

    // Verifica que estamos en la pantalla principal.
    expect(find.text('cámara QR'), findsOneWidget);
    expect(find.text('Abrir cámara'), findsOneWidget);

    // Simula un tap en el botón "Abrir cámara".
    await tester.tap(find.text('Abrir cámara'));
    await tester.pumpAndSettle();

    // Verifica que hemos navegado a la pantalla de escaneo de QR.
    expect(find.text('Escanear QR'), findsOneWidget);
  });
}
