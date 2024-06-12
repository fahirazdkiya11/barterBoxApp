// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:barterboxapp/core/constants/colors.dart';
import 'package:flutter/material.dart';


class HistoryTransactionCard extends StatelessWidget {
  // final OrderModel data;
  final EdgeInsetsGeometry? padding;

  const HistoryTransactionCard({
    super.key,
    // required this.data,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: padding,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          blurRadius: 48.0,
          offset: const Offset(0, 2),
          blurStyle: BlurStyle.outer,
          color: AppColors.black.withOpacity(0.06),
        ),
      ]),
      child: ListTile(
        // leading: Assets.icons.payments.svg(),
        title: const Text(
          '',
        //  data.paymentMethod,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: AppColors.black,
          ),
        ),
        // subtitle: Text('${data.totalQuantity} item'),
        trailing: const Text(
        //  data.totalPrice.currencyFormatRp, 
        '',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.green,
          ),
        ),
      ),
    );
  }
}
