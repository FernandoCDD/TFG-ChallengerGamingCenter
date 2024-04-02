import 'package:challenger_api_front/ui/pages/map.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sobre Nosotros'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildSectionTitle('¿Dónde nos encontramos?'),
                MyMap(),
                _buildVerticalSpace(15),
                _buildSectionTitle('Precios y Abonos'),
                _buildVerticalSpace(10),
                Image.asset('assets/images/tarifas_challenger.png'),
                _buildVerticalSpace(15),
                _buildSectionTitle('Horario y Contacto'),
                _buildScheduleRow('LUNES:', 'CERRADO'),
                _buildScheduleRow('MARTES A JUEVES:', '17:00 - 21:00'),
                _buildScheduleRow('VIERNES y SÁBADO:', '16:00 - 22:00'),
                _buildScheduleRow('DOMINGO:', '16:00 - 21:00'),
                _buildVerticalSpace(15),
                _buildContactRow(Icons.phone, '955 46 84 26'),
                _buildContactRow(
                    Icons.email, 'contacto@challengergamingcenter.com'),
                _buildContactRow(
                    Icons.account_circle, '@challengergamingcenters'),
                _buildContactRow(Icons.facebook, 'Challenger Gaming Center'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildVerticalSpace(double height) {
    return SizedBox(height: height);
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildContactRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(icon, size: 30),
          const SizedBox(width: 15),
          Text(
            text,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleRow(String day, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          const Icon(Icons.calendar_today_rounded, size: 30),
          const SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(day,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold)),
              Text(time,
                  style: const TextStyle(
                      fontSize: 17, fontWeight: FontWeight.bold)),
            ],
          ),
        ],
      ),
    );
  }
}
