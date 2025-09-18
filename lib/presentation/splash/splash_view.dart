import 'dart:async';

import 'package:dreamlabs/app/di.dart';
import 'package:dreamlabs/presentation/home/home_view.dart';
import 'package:dreamlabs/presentation/resources/assets_manager.dart';
import 'package:dreamlabs/presentation/resources/screen_manager.dart';
import 'package:dreamlabs/presentation/resources/value_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../resources/color_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? _timer;
  void _startDelay() {
    _timer = Timer(const Duration(seconds: 2), _goNext);
  }

  void _goNext() async {
    initHomeModule();
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (_) => const HomeView()));
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: ColorManager.primarySwatchMap[900],
        ),
        child: Center(
          child: SizedBox(
            width: context.screenWidth - AppPadding.p80,
            child: SvgPicture.asset(
              ImageAssets.logo,
            ),
          ),
        ),
      ),
    );
  }
}
