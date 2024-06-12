import 'package:flutter/material.dart';

class TorneoDetailPage extends StatefulWidget {
  final String torneoId;

  const TorneoDetailPage({super.key, required this.torneoId});

  @override
  State<TorneoDetailPage> createState() => _TorneoDetailPageState();
}

class _TorneoDetailPageState extends State<TorneoDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del torneo'),
        centerTitle: true,
      ),
      body: const Text('En proceso...'),
    );
  }
}
