import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/features/posts/application/%D8%ADroviders/post_provider.dart';
import 'package:riverpod_project/features/posts/presentation/screens/post_form_screen.dart';
import 'package:riverpod_project/features/posts/presentation/widgets/post_list_widget.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appBarWidget = buildAppBar();
    final floatingButton = buildFloatingButton(context, ref);
    return Scaffold(
      appBar: appBarWidget,
      body: const PostListWidget(),
      floatingActionButton: floatingButton,
    );
  }

  FloatingActionButton buildFloatingButton(
      BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
        onPressed: () =>
            ref.read(postNotifierProvider.notifier).fetchAllPost());
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Text(
        "Clean Architecture",
        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
    );
  }
}
