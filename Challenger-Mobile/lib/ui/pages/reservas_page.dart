import 'package:challenger_api_front/blocs/reserva/bloc/add_reserva_bloc.dart';
import 'package:challenger_api_front/repositories/reservas/reservas_repo_impl.dart';
import 'package:challenger_api_front/ui/pages/reserva_confirmada_page.dart';
import 'package:challenger_api_front/ui/pages/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:omni_datetime_picker/omni_datetime_picker.dart';
import 'package:intl/intl.dart';

class ReservasPage extends StatefulWidget {
  const ReservasPage({Key? key}) : super(key: key);

  @override
  State<ReservasPage> createState() => _ReservasPageState();
}

class _ReservasPageState extends State<ReservasPage> {
  String selectedDevice = 'Tipo de Dispositivo';
  String selectedDateTimeRangeText = 'Fecha y hora';
  List<DateTime>? selectedDateTimeRange;
  late final AddReservaBloc _addReservaBloc;
  final tipoDispositivoController = TextEditingController(); 

  @override
  void initState() {
    super.initState();
    _addReservaBloc = AddReservaBloc(ReservaRepositoryImpl());
  }

  @override
  void dispose() {
    _addReservaBloc.close();
    super.dispose();
  }

  Future<void> _pickDateTimeRange() async {
    final pickedDateTimeRange = await showOmniDateTimeRangePicker(
      context: context,
      startInitialDate: DateTime.now(),
      startFirstDate: DateTime(2024),
      startLastDate: DateTime(2025),
      endInitialDate: DateTime.now().add(const Duration(hours: 1)),
      endFirstDate: DateTime(2024),
      endLastDate: DateTime(2025),
      type: OmniDateTimePickerType.dateAndTime,
    );
    if (pickedDateTimeRange != null && pickedDateTimeRange.length == 2) {
      final dateFormat = DateFormat("dd/MM/yyyy HH:mm");
      setState(() {
        selectedDateTimeRange = pickedDateTimeRange;
        selectedDateTimeRangeText =
            '${dateFormat.format(pickedDateTimeRange[0])} - ${dateFormat.format(pickedDateTimeRange[1])}';
      });
    }
  }

  void _hacerAddReserva() {
    if (selectedDevice != 'Tipo de Dispositivo' && selectedDateTimeRange != null && selectedDateTimeRange!.length == 2) {
      final dateFormat = DateFormat("dd/MM/yyyy HH:mm");
      _addReservaBloc.add(DoAddReservaEvent(
        tipoDispositivo: selectedDevice,
        desde: dateFormat.format(selectedDateTimeRange![0]),
        hasta: dateFormat.format(selectedDateTimeRange![1]),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, selecciona un dispositivo y un rango de fechas válido.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddReservaBloc, AddReservaState>(
      bloc: _addReservaBloc,
      listener: (context, state) {
        if (state is AddReservaSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ReservaConfirmadaPage(),
            ),
          );
        } else if (state is AddReservaError) {
          // Mostrar mensaje de error
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Reservas'),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShoppingCartPage(),
                  ),
                );
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final result = await showModalBottomSheet<String>(
                    context: context,
                    builder: (context) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text('PS4'),
                          onTap: () {
                            Navigator.pop(context, 'PS4');
                          },
                        ),
                        ListTile(
                          title: const Text('ORDENADOR'),
                          onTap: () {
                            Navigator.pop(context, 'ORDENADOR');
                          },
                        ),
                      ],
                    ),
                  );
                  if (result != null) {
                    setState(() {
                      selectedDevice = result;
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 255, 102, 0),
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  selectedDevice.toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 102, 0),
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _pickDateTimeRange,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 60),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 255, 102, 0),
                      width: 2.0,
                    ),
                  ),
                ),
                child: Text(
                  selectedDateTimeRangeText.toUpperCase(),
                  style: const TextStyle(
                    color: Color.fromARGB(255, 255, 102, 0),
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: _hacerAddReserva,
          label: const Text('Finalizar Reserva', style: TextStyle(color: Colors.white)),
          icon: const Icon(Icons.check, color: Colors.white,),
          backgroundColor: const Color.fromARGB(255, 255, 102, 0),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: ReservasPage(),
  ));
}
