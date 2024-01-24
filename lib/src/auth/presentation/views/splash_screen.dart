import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:klarcafe/core/res/colours.dart';

import '../../../../core/common/app/providers/user_provider.dart';
import '../../../../core/common/widgets/gradient_background.dart';
import '../../../../core/res/fonts.dart';
import '../../../../core/res/media_res.dart';
import '../../../../core/utils/core_utils.dart';
import '../../../dashboard/presentation/views/dashboard.dart';
import '../../../ordering/presentation/views/menu_screen.dart';
import '../../data/models/user_model.dart';
import '../bloc/auth_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static const routeName = '/';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<AuthBloc>().add(const SignInWithCredentialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.neutralColour,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) async {
          if (state is AuthError) {
            CoreUtils.showSnackBar(context, state.message);
          } else if (state is SignedIn) {
            context.read<UserProvider>().initUser(state.user as UserModel);
            await Future.delayed(const Duration(seconds: 1), () {
              Navigator.pushReplacementNamed(context, Dashboard.routeName);
            });
          } else if (state is NotSignedIn) {
            await Future.delayed(const Duration(seconds: 1), () {
              Navigator.pushReplacementNamed(context, MenuScreen.routeName);
            });
          }
        },
        builder: (context, state) {
          return GradientBackground(
            image: MediaRes.splashBackground,
            child: SafeArea(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Selamat Datang',
                      style: TextStyle(
                        fontFamily: Fonts.inter,
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        color: Colours.primaryColour,
                      ),
                    ),
                    Image.asset(MediaRes.flutterIcons),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .1,
                    ),
                    const Center(
                      child: CircularProgressIndicator(
                        color: Colours.primaryColour,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
