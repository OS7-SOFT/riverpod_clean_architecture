import 'package:flutter/material.dart';
import 'package:riverpod_project/features/posts/domain/entities/post_entity.dart';
import 'package:riverpod_project/features/posts/presentation/screens/post_form_screen.dart';

class PostWidget extends StatelessWidget {
  final Post post;

  const PostWidget({
    super.key,
    required this.post,
  });

  void deletePost(BuildContext context, int id) async {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      child: Card(
        child: Column(
          children: [
            //title
            Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            //Post Content
            Text(
              post.body,
              style: const TextStyle(
                height: 2,
              ),
              textAlign: TextAlign.center,
            ),
            //action
            Row(
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.delete)),
                IconButton(
                    onPressed: () {
                      pushToPostFormScreen(context);
                    },
                    icon: const Icon(Icons.edit)),
              ],
            )
          ],
        ),
      ),
    );
  }

  void pushToPostFormScreen(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => PostFormScreen(
                  isEdit: true,
                  post: post,
                )));
  }
}
