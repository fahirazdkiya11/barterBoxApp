import 'package:barterboxapp/presentation/myItem/widgets/history_transaction_card.dart';
import 'package:flutter/cupertino.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      itemCount: 3,
      separatorBuilder: (context, index) => const SizedBox(
        height: 30,
      ),
      itemBuilder: (context, index) => HistoryTransactionCard(
        padding: EdgeInsets.symmetric(horizontal: 10),
      ),
    );
  }
}






// import 'package:barterboxapp/presentation/history/widgets/history_transaction_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class HistoryPage extends StatefulWidget {
//   const HistoryPage({super.key});

//   @override
//   State<HistoryPage> createState() => _HistoryPageState();
// }

// class _HistoryPageState extends State<HistoryPage> {

  // @override
  // void initState() {
  //   super.initState();
  //   context.read<HistoryBloc>().add(const HistoryEvent.fetch());
  // }

//   @override
//   Widget build(BuildContext context) {
//     const paddingHorizontal = EdgeInsets.symmetric(horizontal: 16.0);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'History Page',
//           style: TextStyle(
//             fontWeight: FontWeight.w700,
//           ),
//         ),
//         centerTitle: true,
//         elevation: 0,
//       ),
//       body: BlocBuilder<HistoryBloc, HistoryState>(
//         builder: (context, state) {
//           return state.maybeWhen(orElse: () {
//             return const Center(
//               child: Text('No Data'),
//             );
//           }, loading: () {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }, success: (data) {
//             if (data.isEmpty) {
//               return const Center(
//                 child: Text('No Data'),
//               );
//             }
//             return ListView.separated(
//               padding: const EdgeInsets.symmetric(vertical: 10),
//               itemCount: data.length,
//               separatorBuilder: (context, index) => const SizedBox(
//                 height: 30,
//               ),
//               itemBuilder: (context, index) => HistoryTransactionCard(
//                 padding: paddingHorizontal,
//                 data: data[index],
//               ),
//             );
//           });
//         },
//       ),
//     );
//   }
// }
