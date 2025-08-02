import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final messages = <String>[
      'Cargando películas',
      'Comprando palomitas',
      'Cargando populares',
      'Llamando al proyector',
      'Preparando la sala', 
      'Ajustando el sonido',
      'Esto tomará un momento',
    ];
    return Stream.periodic(const Duration(milliseconds: 1200), (step) {
      return messages[step % messages.length];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(
          child: Text('Espere por favor...'),
        ),
        const SizedBox(height: 20),
        const CircularProgressIndicator(strokeWidth: 2),
        const SizedBox(height: 20),
        StreamBuilder(
          stream: getLoadingMessages(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Cargando...');
            return Text(snapshot.data!);
          },
        ),
      ],
    );
  }
}
