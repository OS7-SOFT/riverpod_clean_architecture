import 'package:dartz/dartz.dart';
import 'package:riverpod_project/core/errors/failures.dart';
import 'package:riverpod_project/features/posts/domain/entities/post_entity.dart';
import 'package:riverpod_project/features/posts/domain/repositories/post_repository.dart';

class UpdatePost {
  final PostRepository postRepository;

  UpdatePost({required this.postRepository});

  Future<Either<Failure, Unit>> call(int id, Post post) async {
    return await postRepository.updatePost(id, post);
  }
}
