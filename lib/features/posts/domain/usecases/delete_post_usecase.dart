import 'package:dartz/dartz.dart';
import 'package:riverpod_project/core/errors/failures.dart';
import 'package:riverpod_project/features/posts/domain/repositories/post_repository.dart';

class DeletePost {
  final PostRepository postRepository;

  DeletePost({required this.postRepository});

  Future<Either<Failure, Unit>> call(int id) async {
    return await postRepository.deletePost(id);
  }
}
