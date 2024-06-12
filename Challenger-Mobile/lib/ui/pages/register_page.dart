import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:challenger_api_front/blocs/register/register_bloc.dart';
import 'package:challenger_api_front/blocs/register/register_event.dart';
import 'package:challenger_api_front/blocs/register/register_state.dart';
import 'package:challenger_api_front/repositories/auth/auth_repo.dart';
import 'package:challenger_api_front/repositories/auth/auth_repo_impl.dart';
import 'package:challenger_api_front/ui/pages/login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formRegister = GlobalKey<FormState>();
  final userTextController = TextEditingController();
  final emailTextController = TextEditingController();
  final avatarTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  final verifyPasswordController = TextEditingController();

  late AuthRepository authRepository;
  late RegisterBloc _registerBloc;
  String? errorMessage;

  @override
  void initState() {
    authRepository = AuthRepositoryImpl();
    _registerBloc = RegisterBloc(authRepository);
    super.initState();
  }

  @override
  void dispose() {
    userTextController.dispose();
    emailTextController.dispose();
    avatarTextController.dispose();
    passwordTextController.dispose();
    verifyPasswordController.dispose();
    _registerBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: SingleChildScrollView(
        child: BlocProvider.value(
          value: _registerBloc,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: BlocConsumer<RegisterBloc, RegisterState>(
              buildWhen: (context, state) {
                return state is RegisterInitial || state is DoRegisterError;
              },
              builder: (context, state) {
                if (state is DoRegisterError) {
                  errorMessage = state.errorMessage;
                } else if (state is DoRegisterLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  errorMessage = null;
                }
                return Center(child: _buildRegisterForm());
              },
              listenWhen: (context, state) {
                return state is DoRegisterSuccess;
              },
              listener: (BuildContext context, RegisterState state) {
                if (state is DoRegisterSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterForm() {
    return Form(
      key: _formRegister,
      child: Column(
        children: [
          const Padding(padding: EdgeInsets.only(top: 50.0)),
          Image.asset('assets/images/challenger_logo_login.png'),
          const Text(
            'Formulario de Registro',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 30),
          if (errorMessage != null)
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                border: Border.all(color: Colors.red),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Username',
                style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 126, 126, 126)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              TextFormField(
                controller: userTextController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your username';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 126, 126, 126)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              TextFormField(
                controller: emailTextController,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                  if (!emailRegex.hasMatch(value)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Avatar',
                style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 126, 126, 126)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              TextFormField(
                controller: avatarTextController,
                decoration: const InputDecoration(border: OutlineInputBorder())
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Password',
                style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 126, 126, 126)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              TextFormField(
                controller: passwordTextController,
                obscureText: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  if (value.length < 5 || value.length > 14) {
                    return 'Password must be between 5 and 14 characters';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Verify Password',
                style: TextStyle(fontSize: 17, color: Color.fromARGB(255, 126, 126, 126)),
              ),
              const Padding(padding: EdgeInsets.only(top: 10.0)),
              TextFormField(
                controller: verifyPasswordController,
                obscureText: true,
                decoration: const InputDecoration(border: OutlineInputBorder()),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please verify your password';
                  }
                  if (value.length < 5 || value.length > 14) {
                    return 'Password must be between 5 and 14 characters';
                  }
                  if (value != passwordTextController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
            ],
          ),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(
                    const Color.fromARGB(255, 255, 102, 0)),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                'Register'.toUpperCase(),
                style: const TextStyle(color: Colors.white, fontSize: 17),
              ),
              onPressed: () {
                if (_formRegister.currentState!.validate()) {
                  _registerBloc.add(DoRegisterEvent(
                      userTextController.text,
                      emailTextController.text,
                      avatarTextController.text,
                      passwordTextController.text,
                      verifyPasswordController.text));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
