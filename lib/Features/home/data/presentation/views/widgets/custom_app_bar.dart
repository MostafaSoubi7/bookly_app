import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        // left: 24,
        // right: 24,
        top: 40,
        bottom: 10,
      ),
      child: Row(
        children: [
          Image.asset(
            "assets/images/logo.png",
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            icon: const Icon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
