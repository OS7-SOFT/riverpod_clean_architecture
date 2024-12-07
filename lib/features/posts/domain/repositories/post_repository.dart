import 'package:dartz/dartz.dart';
import 'package:riverpod_project/core/errors/failures.dart';
import 'package:riverpod_project/features/posts/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<Either<Failure, List<Post>>> getAllPosts();
  Future<Either<Failure, Unit>> addNewPost(Post newPost);
  Future<Either<Failure, Unit>> updatePost(int id, Post post);
  Future<Either<Failure, Unit>> deletePost(int id);
}
