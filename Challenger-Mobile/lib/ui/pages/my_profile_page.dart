import 'package:challenger_api_front/blocs/user_profile/user_profile_bloc.dart';
import 'package:challenger_api_front/models/response/my_profile_response.dart';
import 'package:challenger_api_front/repositories/user_profile/user_profile_repo.dart';
import 'package:challenger_api_front/repositories/user_profile/user_profile_repo_impl.dart';
import 'package:challenger_api_front/ui/pages/change_password_form.dart';
import 'package:challenger_api_front/ui/pages/login_page.dart';
import 'package:challenger_api_front/ui/pages/shopping_cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  late UserProfileRepository _userRepo;
  late UserProfileBloc _userProfileBloc;

  @override
  void initState() {
    super.initState();
    _userRepo = UserProfileRepositoryImpl();
    _userProfileBloc = UserProfileBloc(_userRepo)
      ..add(GetUserProfileDetailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mi Perfil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ShoppingCartPage()));
            },
          )
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: BlocProvider.value(
          value: _userProfileBloc,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: BlocBuilder<UserProfileBloc, UserProfileState>(
                builder: (context, state) {
              if (state is DoUserProfileSuccess) {
                return _buildProfilePage(state.myProfileResponse);
              } else if (state is DoUserProfileError) {
                return const Text('Algo ha fallado...');
              } else if (state is DoUserProfileLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Container();
            }),
          ),
        ),
      ),
    );
  }

  Widget _buildProfilePage(MyProfileResponse myProfileResponse) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(myProfileResponse.avatar!),
              ),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                      padding: EdgeInsets.only(top: 30.0, left: 20.0)),
                  Text(
                    myProfileResponse.username!,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFFE96C26),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    myProfileResponse.email!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Color.fromARGB(255, 117, 117, 117),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              const Icon(
                Icons.access_time_rounded,
                size: 30,
              ),
              const SizedBox(width: 25),
              Text(
                'Horas Disponibles: ${myProfileResponse.horasDisponibles!}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              const Icon(
                Icons.date_range,
                size: 30,
              ),
              const SizedBox(width: 25),
              Text(
                'Registrado desde: ${myProfileResponse.createdAt != null ? myProfileResponse.createdAt! : 'null'}',
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        const Divider(
          height: 40,
          thickness: 1,
          color: Colors.black,
        ),
        const Text(
          'AJUSTES',
          style: TextStyle(fontSize: 30),
        ),
        const SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              const Icon(
                Icons.lock,
                size: 30,
              ),
              const SizedBox(width: 25),
              TextButton(
                  child: const Text('Cambiar Contraseña',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const ChangePasswordFormPage()));
                  }),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Row(
            children: [
              const Icon(
                Icons.logout,
                size: 30,
              ),
              const SizedBox(width: 25),
              TextButton(
                  child: const Text('Cerrar Sesión',
                      style: TextStyle(fontSize: 20, color: Colors.black)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
