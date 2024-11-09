import 'package:bookly_app/core/utils/assets.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .27,
      child: AspectRatio(
        aspectRatio: 2.7 / 4,
        child: Container(
          width: 100,
          height: MediaQuery.of(context).size.height * .25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.red,
            image: const DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(
                AssetsData.tetsImages,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
