import 'package:barterboxapp/core/constants/colors.dart';
import 'package:barterboxapp/data/datasources/auth_local_datasource.dart';
import 'package:barterboxapp/data/models/response/auth_response_models.dart';
import 'package:barterboxapp/presentation/auth/pages/login_page.dart';
import 'package:barterboxapp/presentation/dashboard/dashboard_page.dart';
import 'package:barterboxapp/presentation/home/bloc/bloc/logout_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfilePageState extends StatefulWidget {
  const ProfilePageState({super.key});

  @override
  State<ProfilePageState> createState() => _ProfilePageStateState();
}

class _ProfilePageStateState extends State<ProfilePageState> {
  final AuthLocalDataSource _authLocalDataSource = AuthLocalDataSource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.keyboard_arrow_left,
            size: 28,
            color: AppColors.primary,
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return const DashboardPageState();
              }),
            );
          },
        ),
        title: const Text(
          'Profile',
          style: TextStyle(
            color: AppColors.primary,
            letterSpacing: 3,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: BlocConsumer<LogoutBloc, LogoutState>(
              listener: (context, state) {
                state.maybeMap(
                  orElse: () {},
                  success: (_) {
                    AuthLocalDataSource().removeAuthData();
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()));
                  },
                );
              },
              // dibuilder bakal mengembalikan widget
              builder: (context, state) {
                return InkWell(
                  onTap: () {
                    context.read<LogoutBloc>().add(const LogoutEvent.logout());
                  },
                  child: const Icon(
                    Icons.logout_outlined,
                    color: AppColors.primary,
                    size: 25,
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: FutureBuilder<AuthResponseModel>(
        future: _authLocalDataSource.getAuthData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            AuthResponseModel authData = snapshot.data!;
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  AssetImage('assets/images/user.jpg'),
                            ),
                            InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 12,
                                backgroundColor: AppColors.primary,
                                child: Icon(
                                  Icons.edit,
                                  size: 15,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            '${authData.user.name}',
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 1,
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              children: [
                                const Icon(
                                  Icons.email_outlined,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${authData.user.email}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(
                                  Icons.call,
                                  color: AppColors.primary,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${authData.user.phone}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
