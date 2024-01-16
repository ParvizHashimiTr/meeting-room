// ignore_for_file: avoid_print

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../core/assets.dart';
import 'room_page.dart';
import 'widgets/border_widget.dart';
import 'widgets/home_footer.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isPasswordVisiable = false;

  void _login() async {
    try {
      final userName = _userNameController.text.trim();
      final password = _passwordController.text.trim();
      String bearerToken = 'QpwL5tke4Pnpja7X4';

      // https://dev-api.oneof.az/v1/auth/login
      /*
    {
      "username": "elshad123321",
      "password": "123456789"
    }
    */
      final uri = Uri.https('dev-api.oneof.az', '/v1/auth/login');
      final response = await http.post(
        uri,
        body: {
          'username': userName,
          'password': password,
        },
        headers: {
          'Authorization': 'Bearer $bearerToken',
        },
      );
      if (!mounted) return;
      if (response.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const RoomPage(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context)
          ..hideCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('Login failed. Please try again.'),
              backgroundColor: Colors.red,
            ),
          );
      }
    } catch (e) {
      debugPrintThrottled(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: 10000,
            height: 10000,
            child: Image.asset(
              'assets/time_bg.png',
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Column(
                    children: [
                      Image.asset(
                        Images.logo,
                        height: 180,
                      ),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'User name is required';
                            }
                            return null;
                          },
                          controller: _userNameController,
                          decoration: InputDecoration(
                            hintText: 'User name',
                            enabledBorder: borderAll,
                            focusedBorder: borderAll,
                            errorBorder: errorBorder,
                            focusedErrorBorder: errorBorder,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        width: 400,
                        child: TextFormField(
                          textAlign: TextAlign.center,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password is required';
                            }
                            return null;
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                            hintText: 'Password',
                            enabledBorder: borderAll,
                            focusedBorder: borderAll,
                            errorBorder: errorBorder,
                            focusedErrorBorder: errorBorder,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisiable = !_isPasswordVisiable;
                                });
                              },
                              icon: Icon(_isPasswordVisiable
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                          obscureText: !_isPasswordVisiable,
                          obscuringCharacter: '*',
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                      SizedBox(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _login();

                              // setState(
                              //   () {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => const RoomPage(),
                              //       ),
                              //     );
                              //     _formKey.currentState!.reset();
                              //   },
                              // );
                            }
                            _formKey.currentState!.reset();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF98BF34),
                            side:
                                const BorderSide(color: Colors.white, width: 5),
                          ),
                          child: const Text(
                            'Giriş',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const HomeFooter(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
