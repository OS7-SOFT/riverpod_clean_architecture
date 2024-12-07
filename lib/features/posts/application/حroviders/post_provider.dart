import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_project/features/posts/application/%D8%ADroviders/post_notifer.dart';
import 'package:riverpod_project/features/posts/domain/entities/post_entity.dart';
import 'package:riverpod_project/features/posts/domain/repositories/post_repository.dart';
import 'package:riverpod_project/features/posts/domain/usecases/add_new_post_usecase.dart';
import 'package:riverpod_project/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:riverpod_project/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:riverpod_project/dependency_injection_.dart' as di;
import 'package:riverpod_project/features/posts/domain/usecases/update_post_usecase.dart';

final postRepositoryProvider = Provider<PostRepository>((ref) {
  return di.getIt<PostRepository>();
});

final getAllPostsProvider = Provider<GetAllPosts>((ref) {
  return GetAllPosts(postRepository: ref.read(postRepositoryProvider));
});

final addPostProvider = Provider<AddNewPost>((ref) {
  return AddNewPost(postRepository: ref.read(postRepositoryProvider));
});

final updatePostProvider = Provider<UpdatePost>((ref) {
  return UpdatePost(postRepository: ref.read(postRepositoryProvider));
});
final deletePostProvider = Provider<DeletePost>((ref) {
  return DeletePost(postRepository: ref.read(postRepositoryProvider));
});

final postNotifierProvider =
    StateNotifierProvider<PostNotifier, AsyncValue<List<Post>>>((ref) {
  return PostNotifier(ref.read(getAllPostsProvider), ref.read(addPostProvider),
      ref.read(updatePostProvider), ref.read(deletePostProvider));
});
