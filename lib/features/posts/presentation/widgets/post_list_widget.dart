import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/core/widgets/Indicator_loading_widget.dart';
import 'package:riverpod_project/features/posts/application/%D8%ADroviders/post_provider.dart';

class PostListWidget extends ConsumerWidget {
  const PostListWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsState = ref.watch(postNotifierProvider);
    return postsState.when(
        data: (posts) => ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
            ),
        error: (error, stack) => Center(child: Text('Error: $error')),
        loading: () => const IndicatorLoading(
            shapeColor: Colors.blue, textColor: Colors.white));
  }
}
