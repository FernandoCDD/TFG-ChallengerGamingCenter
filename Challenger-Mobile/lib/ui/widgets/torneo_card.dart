import 'package:challenger_api_front/models/response/torneo_list_response/content.dart';
import 'package:challenger_api_front/ui/pages/torneo_detail_page.dart';
import 'package:flutter/material.dart';

class TorneoCard extends StatelessWidget {
  final Torneos torneos;
  final int index;

  const TorneoCard({super.key, required this.index, required this.torneos});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  TorneoDetailPage(torneoId: torneos.id.toString())),
        );
      },
      child: Card(
        color: Colors.white,
        surfaceTintColor: Colors.white,
        elevation: 2,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
              color: Color.fromARGB(255, 255, 102, 0), width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: SizedBox(
          width: double.infinity,
          height: 150,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    torneos.imagenUrl!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        torneos.juego!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        cambiarFormatoFecha(torneos.fecha!.toString()),
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 255, 102, 0)),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.person,
                              color: Color.fromARGB(255, 255, 115, 22)),
                          const SizedBox(width: 4),
                          Text(
                            torneos.participantes!.length.toString(),
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String cambiarFormatoFecha(String fecha) {
  DateTime fechaObjeto = DateTime.parse(fecha);

  List<String> nombresMeses = [
    'ENE.',
    'FEB.',
    'MAR.',
    'ABR.',
    'MAY.',
    'JUN.',
    'JUL.',
    'AGO.',
    'SEP.',
    'OCT.',
    'NOV.',
    'DIC.'
  ];

  String nombreMes = nombresMeses[fechaObjeto.month - 1];

  String nuevoFormato =
      '${fechaObjeto.day}$nombreMes ${fechaObjeto.year} ${fechaObjeto.hour}:${fechaObjeto.minute}${fechaObjeto.minute}';

  return nuevoFormato;
}
