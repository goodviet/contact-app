import 'package:contact/widgets/button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/login_bloc.dart';
import '../widgets/textfield_custom.dart';
import 'contact_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

// Lắng nghe các trạng thái của LoginBloc
  void _onLoginListener(BuildContext context, LoginState state) {
    if (state is LoginSuccess) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const ContactScreen()),
      );
    } else if (state is LoginFailure) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login Failed")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: BlocConsumer<LoginBloc, LoginState>(
            listener: _onLoginListener,
            builder: (context, state) {
              if (state is LoginLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 100),
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.amber,
                      ),
                    ),
                    const SizedBox(height: 50),
                    const Text(
                      "Username",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CustomTextField(
                      controller: _usernameController,
                      hintText: 'Username',
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Password",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CustomTextField(
                      controller: _passwordController,
                      hintText: 'Password',
                      isPassword: true,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text("Forgot Password?",
                            style: TextStyle(
                              color: Color.fromARGB(255, 9, 57, 55),
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 48,
                    ),
                    CustomButton(
                      text: "Login",
                      onPressed: () {
                        context.read<LoginBloc>().add(
                              LoginSubmitted(
                                _usernameController.text,
                                _passwordController.text,
                              ),
                            );
                      },
                    ),
                    const SizedBox(height: 100),
                    Align(
                      alignment: Alignment.center,
                      child: TextButton(
                        onPressed: () {
                        },
                        child: Text(
                          "Don't have an account? Sign up",
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
