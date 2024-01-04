// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

import '../../core/assets.dart';
import 'room_page.dart';
import 'widgets/home_footer.dart';

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

  @override
  Widget build(BuildContext context) {
    final borderAll = OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(
        width: 5,
        color: Colors.white,
      ),
    );

    final errorBorder = borderAll.copyWith(
      borderSide: const BorderSide(
        color: Colors.red,
      ),
    );

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 10,
                      )),
                  Image.asset(
                    Images.logo,
                    height: 180,
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
                          setState(
                            () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const RoomPage(),
                                ),
                              );
                              _formKey.currentState!.reset();
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF98BF34),
                        side: const BorderSide(color: Colors.white, width: 5),
                      ),
                      child: const Text(
                        'Giriş',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                  ),
                  const Spacer(),
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
