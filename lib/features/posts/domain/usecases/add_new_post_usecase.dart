import 'package:dartz/dartz.dart';
import 'package:riverpod_project/core/errors/failures.dart';
import 'package:riverpod_project/features/posts/domain/entities/post_entity.dart';
import 'package:riverpod_project/features/posts/domain/repositories/post_repository.dart';

class AddNewPost {
  final PostRepository postRepository;

  AddNewPost({required this.postRepository});

  Future<Either<Failure, Unit>> call(Post newPost) async {
    return await postRepository.addNewPost(newPost);
  }
}
