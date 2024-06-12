import 'package:barterboxapp/core/constants/colors.dart';
import 'package:barterboxapp/presentation/home/pages/search_page.dart';
import 'package:barterboxapp/presentation/profile/pages/profile_page.dart';
import 'package:flutter/material.dart';

class DashboardPageState extends StatefulWidget {
  const DashboardPageState({super.key});

  @override
  State<DashboardPageState> createState() => _DashboardPageStateState();
}

class _DashboardPageStateState extends State<DashboardPageState> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const SearchPageState(),
    const ProfilePageState(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(30),
          ),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, -2),
              blurRadius: 20.0,
              blurStyle: BlurStyle.outer,
              spreadRadius: 0,
              color: AppColors.black.withOpacity(0.08),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () => _onItemTapped(0),
              icon: const Icon(
                Icons.search_outlined,
              ),
            ),
            IconButton(
              onPressed: () => _onItemTapped(1),
              icon: const Icon(
                Icons.person_outlined,
              ),
            ),
          ],
        ),
      ),
    );
  }
}




// import 'package:barterboxapp/core/constants/colors.dart';
// import 'package:barterboxapp/presentation/myItem/pages/history_page.dart';
// import 'package:barterboxapp/presentation/profile/pages/profile_page.dart';
// import 'package:barterboxapp/presentation/home/pages/search_page.dart';
// import 'package:barterboxapp/screen/onboarding_screen.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:pandabar/main.view.dart';
// import 'package:pandabar/model.dart';

// class DashboardPage extends StatefulWidget {
//   const DashboardPage({super.key});

//   @override
//   State<DashboardPage> createState() => _DashboardPageState();
// }

// class _DashboardPageState extends State<DashboardPage> {
//   String page = 'Orange';

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBody: true,
//       bottomNavigationBar: PandaBar(
//         backgroundColor: Colors.white,
//         buttonColor: Colors.white,
//         buttonSelectedColor: AppColors.primary,
//         fabIcon: const Icon(
//           Icons.star,
//           color: Colors.white,
//         ),
//         fabColors: const [
//           Colors.white,
//           AppColors.primary,
//         ],
//         buttonData: [
//           PandaBarButtonData(
//             id: 'Orange',
//             icon: Icons.search_outlined,
//             title: 'Search',
//           ),
//           PandaBarButtonData(
//             id: 'Green',
//             icon: Icons.lightbulb_outline,
//             title: 'Guide',
//           ),
//           PandaBarButtonData(
//             id: 'Red',
//             icon: Icons.history_outlined,
//             title: 'History',
//           ),
//           PandaBarButtonData(
//             id: 'Yellow',
//             icon: Icons.person_outline,
//             title: 'Account',
//           ),
//         ],
//         onChange: (id) {
//           setState(() {
//             page = id;
//           });
//         },
//         onFabButtonPressed: () {
//           showCupertinoDialog(
//             context: context,
//             builder: (context) {
//               return CupertinoAlertDialog(
//                 content: const Text('Fab Button Presses!'),
//                 actions: [
//                   CupertinoDialogAction(
//                     isDestructiveAction: true,
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     child: const Text('Close'),
//                   ),
//                 ],
//               );
//             },
//           );
//         },
//       ),
//       body: Builder(
//         builder: (context) {
//           switch (page) {
//             case 'Green':
//               return const OnboardingScreen();
//             case 'Orange':
//               return const SearchPageState();
//             case 'Red':
//               return const HistoryPage();
//             case 'Yellow':
//               return const ProfilePageState();
//             default:
//               return Container();
//           }
//         },
//       ),
//     );
//   }
// }
