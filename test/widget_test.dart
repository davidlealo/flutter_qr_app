import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_qr_app/main.dart';

void main() {
  testWidgets('Navigation and invalid code handling', (WidgetTester tester) async {
    // Construye la app y activa un fotograma.
    await tester.pumpWidget(MyApp());

    // Verifica que estamos en la pantalla principal.
    expect(find.text('cámara QR'), findsOneWidget);
    expect(find.text('Validar código'), findsOneWidget);

    // Simula un tap en el botón de validar con código incorrecto.
    await tester.enterText(find.byType(TextField), '654321');
    await tester.tap(find.text('Validar código'));
    await tester.pump();

    // Verifica que se muestra un mensaje de error.
    expect(find.text('El código ingresado es incorrecto.'), findsOneWidget);

    // Ingresa el código correcto.
    await tester.enterText(find.byType(TextField), '123456');
    await tester.tap(find.text('Validar código'));
    await tester.pumpAndSettle();

    // Verifica que se navega a la pantalla de resultados.
    expect(find.text('Resultado Escaneado'), findsOneWidget);
    expect(find.text('123456'), findsOneWidget);
  });
}
