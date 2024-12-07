import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:riverpod_project/core/network/network_info.dart';
import 'package:riverpod_project/features/posts/data/datasources/post_local_data_source.dart';
import 'package:riverpod_project/features/posts/data/datasources/post_remote_data_source.dart';
import 'package:riverpod_project/features/posts/data/repositories/post_repository_impl.dart';
import 'package:riverpod_project/features/posts/domain/repositories/post_repository.dart';
import 'package:riverpod_project/features/posts/domain/usecases/add_new_post_usecase.dart';
import 'package:riverpod_project/features/posts/domain/usecases/delete_post_usecase.dart';
import 'package:riverpod_project/features/posts/domain/usecases/get_all_posts_usecase.dart';
import 'package:riverpod_project/features/posts/domain/usecases/update_post_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  getIt.registerLazySingleton<PostRepository>(() => PostRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt()));

  getIt.registerLazySingleton(() => GetAllPosts(postRepository: getIt()));
  getIt.registerLazySingleton(() => AddNewPost(postRepository: getIt()));
  getIt.registerLazySingleton(() => UpdatePost(postRepository: getIt()));
  getIt.registerLazySingleton(() => DeletePost(postRepository: getIt()));

  getIt.registerLazySingleton<PostRemoteDataSource>(
      () => PostRemoteDataSourceImpl(dio: Dio()));
  getIt.registerLazySingleton<PostLocalDataSource>(
      () => PostLocalDataSourceImpl(sharedPreferences: getIt()));

  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  getIt.registerLazySingleton(() => sharedPreferences);

  getIt.registerLazySingleton(() => InternetConnectionChecker());
}
