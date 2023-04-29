import 'dart:convert';

import 'package:BTechAppLatihan/cubit/login/logincubit.dart';
import 'package:BTechAppLatihan/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/services.dart' show rootBundle;

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late LoginCubit _loginCubit;

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  late List<dynamic> _users;

  Future<void> loadJson() async {
    final jsonString = await rootBundle.loadString('assets/data/login_data.json');
    final jsonResponse = json.decode(jsonString);
    setState(() {
      _users = jsonResponse['login'];
    });
  }

  @override
  void initState() {
    super.initState();
    loadJson();
    _loginCubit = LoginCubit();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    _loginCubit.close();
    super.dispose();
  }
  void _onLoginButtonPressed() {
    if (_users != null) {
      final user = _users.firstWhere(
            (user) =>
        user['username'] == _usernameController.text && user['password'] == _passwordController.text,
        orElse: () => null,
      );

      if (user != null) {
        _loginCubit.emit(LoginState.success());
        // arahkan ke halaman home
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        _loginCubit.emit(LoginState.failure('Invalid username or password'));
        // tampilkan pesan kesalahan
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Login Error'),
            content: const Text('Invalid username or password'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     // debugShowCheckedModeBanner: false,
      title: 'Login',
      home: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: double.infinity,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    child: Image.asset('assets/images/logo_bga.png', scale: 1.5,),
                  ),
                  SizedBox(height: 5.0,),
                  Text('BTech Mobile',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),

                  BlocConsumer<LoginCubit, LoginState>(
                    bloc: _loginCubit,
                    listener: (context, state) {
                      if (state.isSuccess) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            const SnackBar(content: Text('Login Success')),
                          );
                      } else if (state.error.isNotEmpty) {
                        ScaffoldMessenger.of(context)
                          ..hideCurrentSnackBar()
                          ..showSnackBar(
                            SnackBar(content: Text(state.error)),
                          );
                      }
                    },
                    builder: (context, state) {
                      return Padding(
                        padding:  EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.1,
                        right: MediaQuery.of(context).size.width * 0.1),
                        child: Form(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              if (state.isLoading) ...[
                                const CircularProgressIndicator(),
                                 SizedBox( height: MediaQuery.of(context).size.height * 0.03),
                              ],
                              TextFormField(

                                controller: _usernameController,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Username Required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(width: 3, color: Colors.orange),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  prefixIcon: Icon(Icons.person),
                                  labelText: 'Username',
                                  hintText: 'Enter your username',
                                ),
                              ),
                              SizedBox( height: MediaQuery.of(context).size.height * 0.03),
                              TextFormField(
                                controller: _passwordController,
                                validator: (value){
                                  if(value == null || value.isEmpty){
                                    return 'Password Required';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide:  const BorderSide(width: 3, color: Colors.orange),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  prefixIcon: Icon(Icons.lock),
                                  labelText: 'Password',
                                  hintText: 'Enter your password',
                                ),
                                obscureText: true,
                              ),

                               SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                              BgaButton(
                                text: 'Login',
                                onPressed: state.isLoading ? null : _onLoginButtonPressed,
                              ),

                              // ElevatedButton(
                              //   onPressed: state.isLoading ? null : _onLoginButtonPressed,
                              //   child: const Text('LOGIN'),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
