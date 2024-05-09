import 'package:challenger_api_front/blocs/torneos/torneos_bloc.dart';
import 'package:challenger_api_front/repositories/torneos/torneos_repo.dart';
import 'package:challenger_api_front/repositories/torneos/torneos_repo_impl.dart';
import 'package:challenger_api_front/ui/widgets/torneo_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TorneosPage extends StatefulWidget {
  const TorneosPage({Key? key}) : super(key: key);

  @override
  State<TorneosPage> createState() => _TorneosPageState();
}

class _TorneosPageState extends State<TorneosPage> {
  late TorneoRepository _torneoRepository;
  late TorneosBloc _torneosBloc;
  bool isPressed = false;

  @override
  void initState() {
    _torneoRepository = TorneoRepositoryImpl();
    _torneosBloc = TorneosBloc(_torneoRepository)..add(GetTorneosEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _torneosBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Torneos'),
          centerTitle: true,
        ),
        body: BlocBuilder<TorneosBloc, TorneosState>(
          builder: (context, state) {
            if (state is DoTorneosSuccess) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(padding: EdgeInsets.only(left: 6.0)),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFE96C26),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'Filtrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 120.0, right: 5.0, top: 5.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(7),
                                ),
                                child: TextField(
                                  decoration: const InputDecoration(
                                    hintText: 'Buscar...',
                                    border: InputBorder.none,
                                    prefixIcon: Icon(Icons.search),
                                    contentPadding: EdgeInsets.all(10),
                                  ),
                                  onChanged: (value) {
                                    // Lógica para búsqueda
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 15.0)),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.torneos.content!.length,
                        itemBuilder: (context, index) {
                          final torneo = state.torneos.content![index];
                          return TorneoCard(
                            torneos: torneo,
                            index: index,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            } else if (state is DoTorneosError) {
              return Text('Algo ha fallado... ${state.errorMessage}');
            } else if (state is DoTorneosLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return Container();
          },
        ),
      ),
    );
  }
}
