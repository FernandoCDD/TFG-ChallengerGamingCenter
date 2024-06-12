import 'package:challenger_api_front/ui/pages/home_page.dart';
import 'package:flutter/material.dart';

class PedidoConfirmadoPage extends StatelessWidget {
  const PedidoConfirmadoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                'https://cdn-icons-png.flaticon.com/512/2242/2242681.png',
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                '¡GRACIAS!',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                '¡Tu pedido ha sido confirmado y te está esperando en el centro!',
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(
                      const Color.fromARGB(255, 255, 102, 0)),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(10.0), // Valor del radio
                    ),
                  ),
                ),
                child: Text(
                  'Volver al inicio'.toUpperCase(),
                  style: const TextStyle(color: Colors.white, fontSize: 17),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const HomePage()),
                    (Route<dynamic> route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
