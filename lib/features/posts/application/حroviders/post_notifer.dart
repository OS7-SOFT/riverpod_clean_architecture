import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/features/posts/domain/entities/post_entity.dart';
import 'package:riverpod_project/features/posts/domain/usecases/add_new_post_usecase.dart';
import 'package:riverpod_project/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:riverpod_project/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:riverpod_project/features/posts/domain/usecases/update_post_usecase.dart';

class PostNotifier extends StateNotifier<AsyncValue<List<Post>>> {
  final GetAllPosts getAllPosts;
  final AddNewPost addNewPost;
  final UpdatePost updatePost;
  final DeletePost deletePost;
  PostNotifier(
      this.getAllPosts, this.addNewPost, this.updatePost, this.deletePost)
      : super(const AsyncValue.loading()) {
    _initialize();
  }

  void _initialize() {
    Future.microtask(() => fetchAllPost());
  }

  Future<void> fetchAllPost() async {
    state = const AsyncValue.loading();
    print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssss");
    final result = await getAllPosts.call();
    result.fold(
        (failure) =>
            state = AsyncValue.error(failure.getMessage, failure as StackTrace),
        (posts) => state = AsyncValue.data(posts));
  }
}
