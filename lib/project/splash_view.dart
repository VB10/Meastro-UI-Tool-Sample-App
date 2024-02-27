import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:meastro_sample/project/login_view.dart';

final class SplashView extends StatefulWidget {
  const SplashView({super.key});
  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> with _SplashViewMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(child: CircularProgressIndicator()),
    );
  }
}

mixin _SplashViewMixin on State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      context.route.navigateToPage(const LoginView());
    });
  }
}
