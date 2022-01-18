import 'package:flutter/material.dart';
import 'package:flutter_app/src/services/providers/post_provider.dart';
import 'package:flutter_app/src/services/routers/routes_paths.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // You can call it anywhere in the app and it will keep the state
    PostProvider.of().getAllPosts();

    // Navigating to home screen after 3 seconds, can replace with the auth state
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RoutesPaths.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(child: CircularProgressIndicator()),
    );
  }
}
