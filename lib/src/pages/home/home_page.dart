import 'package:flutter/material.dart';
import 'package:flutter_app/src/config/enums.dart';
import 'package:flutter_app/src/resources/colors.dart';
import 'package:flutter_app/src/resources/dimens.dart';
import 'package:flutter_app/src/services/providers/post_provider.dart';
import 'package:flutter_app/src/widgets/dynamicText/dynamic_text.dart';
import 'package:flutter_app/src/widgets/dynamic_appbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      color: ColorStyle.appBackgroundColor,
      child: SafeArea(
        child: Column(
          children: [
            _header(size: size),
            Expanded(child: _body(size)),
          ],
        ),
      ),
    );
  }

  Widget _header({Size? size}) {
    return DynamicAppbar(
      hasBackButton: false,
      hasFrontButton: true,
      child: Row(
        children: [
          const SizedBox(width: Dimens.padding_14),
          const DynamicText(text: 'User Posts'),
          const Spacer(),
          IconButton(
            onPressed: () {
              PostProvider.of().changeStateToLoading();
              PostProvider.of().getAllPosts();
            },
            icon: const Icon(Icons.replay_outlined),
          ),
        ],
      ),
    );
  }

  Widget _body(Size size) {
    return Consumer<PostProvider>(
      builder: (context, value, child) {
        if (value.state == AuthStateEnum.loading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (value.state == AuthStateEnum.failed) {
          return const Center(
              child: DynamicText(text: 'Something went wrong!'));
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: value.allPosts.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: DynamicText(
                text: value.allPosts[index].title,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              subtitle: DynamicText(text: value.allPosts[index].body),
            );
          },
        );
      },
    );
  }
}
