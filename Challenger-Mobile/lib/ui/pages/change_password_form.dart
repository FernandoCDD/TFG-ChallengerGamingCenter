import 'package:challenger_api_front/blocs/user_profile/change_password/change_password_bloc.dart';
import 'package:challenger_api_front/repositories/user_profile/user_profile_repo.dart';
import 'package:challenger_api_front/repositories/user_profile/user_profile_repo_impl.dart';
import 'package:challenger_api_front/ui/pages/my_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordFormPage extends StatefulWidget {
  const ChangePasswordFormPage({super.key});

  @override
  State<ChangePasswordFormPage> createState() => _ChangePasswordFormPageState();
}

class _ChangePasswordFormPageState extends State<ChangePasswordFormPage> {
  final _changePasswordForm = GlobalKey<FormState>();
  final _oldPasswordTextController = TextEditingController();
  final _newPasswordTextController = TextEditingController();
  final _verifyPasswordTextController = TextEditingController();

  late UserProfileRepository userProfileRepository;
  late ChangePasswordBloc _changePasswordBloc;

  @override
  void initState() {
    userProfileRepository = UserProfileRepositoryImpl();
    _changePasswordBloc = ChangePasswordBloc(userProfileRepository);
    super.initState();
  }

  @override
  void dispose() {
    _oldPasswordTextController.dispose();
    _newPasswordTextController.dispose();
    _verifyPasswordTextController.dispose();
    _changePasswordBloc.close();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cambiar contraseña'),
        toolbarHeight: 0,
      ),
      body: SingleChildScrollView(
        child: BlocProvider.value(
          value: _changePasswordBloc,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<ChangePasswordBloc, ChangePasswordState>(
              buildWhen: (context, state) {
                return state is ChangePasswordInitial ||
                    state is DoChangePasswordError;
              },
              listener: (context, state) {
                if (state is DoChangePasswordSuccess) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UserProfilePage()));
                } else if (state is DoChangePasswordError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Error al cambiar la contraseña'),
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is DoChangePasswordLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return Center(
                  child: _buildChangePasswordForm(),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildChangePasswordForm() {
    return Form(
      key: _changePasswordForm,
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          Image.asset('assets/images/challenger_logo_login.png'),
          const Text(
            'Cambiar Contraseña',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 30,
          ),
          TextFormField(
            controller: _oldPasswordTextController,
            decoration: const InputDecoration(
              labelText: 'Contraseña actual',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese su contraseña actual';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _newPasswordTextController,
            decoration: const InputDecoration(
              labelText: 'Nueva contraseña',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese su nueva contraseña';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _verifyPasswordTextController,
            decoration: const InputDecoration(
              labelText: 'Verificar contraseña',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, verifique su nueva contraseña';
              }
              if (value != _newPasswordTextController.text) {
                return 'Las contraseñas no coinciden';
              }
              return null;
            },
          ),
          const Padding(padding: EdgeInsets.only(top: 20.0)),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 255, 102, 0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                'CAMBIAR CONTRASEÑA'.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              onPressed: () {
                if (_changePasswordForm.currentState!.validate()) {
                  _changePasswordBloc.add(DoChangePasswordEvent(
                    _oldPasswordTextController.text,
                    _newPasswordTextController.text,
                    _verifyPasswordTextController.text,
                  ));
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
