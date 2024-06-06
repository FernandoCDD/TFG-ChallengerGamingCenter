import 'package:challenger_api_front/blocs/login/login_bloc.dart';
import 'package:challenger_api_front/repositories/auth/auth_repo.dart';
import 'package:challenger_api_front/repositories/auth/auth_repo_impl.dart';
import 'package:challenger_api_front/ui/pages/home_page.dart';
import 'package:challenger_api_front/ui/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formLogin = GlobalKey<FormState>();
  final userTextController = TextEditingController(text: 'FernandoCD');
  final passTextController = TextEditingController(text: '1234');

  late AuthRepository authRepository;
  late LoginBloc _loginBloc;

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _loginBloc = LoginBloc(authRepository);
    super.initState();
  }

  @override
  void dispose() {
    userTextController.dispose();
    passTextController.dispose();
    _loginBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          toolbarHeight: 0,
        ),
        body: SingleChildScrollView(
          child: BlocProvider.value(
            value: _loginBloc,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocConsumer<LoginBloc, LoginState>(
                buildWhen: (context, state) {
                  return state is LoginInitial || state is DoLoginError;
                },
                builder: (context, state) {
                  if (state is DoLoginError) {
                    return const Text('Login error');
                  } else if (state is DoLoginLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  return Center(child: _buildLoginForm());
                },
                listenWhen: (context, state) {
                  return state is DoLoginSuccess;
                },
                listener: (BuildContext context, LoginState state) {
                  if (state is DoLoginSuccess) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomePage()));
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildLoginForm() {
    return Form(
      key: _formLogin,
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          Image.asset('assets/images/challenger_logo_login.png'),
          const Text(
            'Bienvenido!',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 126, 126, 126)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              TextFormField(
                controller: userTextController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Password',
                style: TextStyle(
                    fontSize: 17, color: Color.fromARGB(255, 126, 126, 126)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              TextFormField(
                controller: passTextController,
                obscureText: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 255, 102, 0)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(10.0), // Valor del radio
                  ),
                ),
              ),
              child: Text(
                'Login'.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              onPressed: () {
                if (_formLogin.currentState!.validate()) {
                  _loginBloc.add(DoLoginEvent(
                    userTextController.text,
                    passTextController.text,
                  ));
                }
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          const Divider(
            height: 0,
            thickness: 1,
            indent: 0,
            endIndent: 0,
            color: Colors.black,
          ),
          const SizedBox(
            height: 40,
          ),
          Row(
            children: [
              const Text(
                'No tienes cuenta?',
                style: TextStyle(fontSize: 20),
              ),
              const Spacer(),
              TextButton(
                  child: const Text('Registrate',
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 102, 0),
                          fontSize: 20)),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()));
                  }),
            ],
          )
        ],
      ),
    );
  }
}
/*

*/
