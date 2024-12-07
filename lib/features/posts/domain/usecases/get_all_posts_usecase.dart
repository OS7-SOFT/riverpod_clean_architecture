import 'package:dartz/dartz.dart';
import 'package:riverpod_project/core/errors/failures.dart';
import 'package:riverpod_project/features/posts/domain/entities/post_entity.dart';
import 'package:riverpod_project/features/posts/domain/repositories/post_repository.dart';

class GetAllPosts {
  final PostRepository postRepository;

  GetAllPosts({required this.postRepository});

  Future<Either<Failure, List<Post>>> call() async {
    return await postRepository.getAllPosts();
  }
}
