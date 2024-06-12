import 'package:barterboxapp/presentation/dashboard/dashboard_page.dart';

import '../../../core/components/my_button.dart';
import '../../../core/components/my_text_field.dart';
import '../../../gen/assets.gen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/datasources/auth_local_datasource.dart';
import '../bloc/login/login_bloc.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({
    super.key,
    this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controller
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                // logo
                Container(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.images.logo.path,
                        width: 150,
                      ),
                      const Text(
                        'BarterBox',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 35,
                          fontWeight: FontWeight.w700,
                          letterSpacing: BorderSide.strokeAlignOutside,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                // email textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                // password
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                BlocListener<LoginBloc, LoginState>(
                  listener: (context, state) {
                    state.maybeWhen(
                        orElse: () {},
                        success: (authResponseModel) {
                          AuthLocalDataSource().saveAuthData(authResponseModel);
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const DashboardPageState(),
                            ),
                          );
                        },
                        error: (message) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        });
                  },
                  child: BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        orElse: () {
                          return MyButton(
                              text: 'Sign In',
                              onTap: () {
                                context.read<LoginBloc>().add(
                                      LoginEvent.login(
                                        email: emailController.text,
                                        password: passwordController.text,
                                      ),
                                    );
                              });
                        },
                        loading: () {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
