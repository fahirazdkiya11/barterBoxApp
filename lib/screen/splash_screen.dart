import 'package:barterboxapp/presentation/auth/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginPage()));
    });
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Colors.orange],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo.png',
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
    );
  }
}

// import 'package:barterboxapp/presentation/dashboard/dashboard_page.dart';
// import 'package:flutter/material.dart';

// class AnimateSplashScreen extends StatefulWidget {
//   const AnimateSplashScreen({super.key});

//   @override
//   State<AnimateSplashScreen> createState() => _AnimateSplashScreenState();
// }

// class _AnimateSplashScreenState extends State<AnimateSplashScreen>
//     with SingleTickerProviderStateMixin {
//   AnimationController? _controller;
//   Animation? _animation;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 2),
//     );

//     _animation = Tween(begin: 0.0, end: 1.0).animate(_controller!)
//       ..addListener(() {
//         setState(() {});
//       });

//     _controller?.forward();

//     Future.delayed(const Duration(seconds: 3), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (context) => const DashboardPage()),
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Opacity(
//             opacity: _animation?.value,
//             child: Image.asset('assets/images/logo.png'),
//           ),
//           const Text(
//             'BarterBox',
//             style: TextStyle(
//               color: Colors.orange,
//               fontSize: 35,
//               fontWeight: FontWeight.w700,
//               letterSpacing: BorderSide.strokeAlignOutside,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
