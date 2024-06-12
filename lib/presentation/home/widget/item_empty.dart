import 'package:barterboxapp/core/constants/colors.dart';
import 'package:flutter/material.dart';

class ItemEmpty extends StatelessWidget {
  const ItemEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 115,
            color: Colors.grey,
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            "Belum Ada Item",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
