import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:product_list/features/data/datasource/product_list_remote_data_source.dart';
import 'package:product_list/features/data/datasource/login_remote_data_source.dart';
import 'package:product_list/features/data/datasource/product_detail_remote_data_source.dart';
import 'package:product_list/features/data/repositoriesimpl/home_repository_impl.dart';
import 'package:product_list/features/data/repositoriesimpl/login_repository_impl.dart';
import 'package:product_list/features/data/repositoriesimpl/product_detail_repository_impl.dart';
import 'package:product_list/features/domain/repositories/home_repository.dart';
import 'package:product_list/features/domain/repositories/login_repository.dart';
import 'package:product_list/features/domain/repositories/product_detail_repository.dart';
import 'package:product_list/features/domain/usecases/get_product_detail_usecase.dart';
import 'package:product_list/features/domain/usecases/get_product_list_usecase.dart';
import 'package:product_list/features/presesntation/pages/login/bloc/login_bloc.dart';
import 'package:product_list/features/presesntation/pages/product_list/bloc/product_list_bloc.dart';
import 'package:product_list/features/presesntation/pages/productdetail/bloc/product_detail_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/network/endpoints.dart';
import '../features/domain/usecases/login_usecase.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerFactory(() => LoginBloc());
  sl.registerFactory(() => ProductListBloc(getProductListUseCase: sl()));
  sl.registerFactory(() => ProductDetailBloc(getProductDetailUseCase: sl()));

  //UseCases
  sl.registerFactory(() => LoginUseCase(loginRepository: sl()));
  sl.registerFactory(() => GetProductListUseCase(homeRepository: sl()));
  sl.registerFactory(() => GetProductDetailUseCase(productDetailRepository: sl()));

  //Repositories
  sl.registerFactory<LoginRepository>(() => LoginRepositoryImpl(
        remoteDataSource: sl(),
        // networkInfo: sl(),
      ));

  sl.registerFactory<HomeRepository>(() => HomeRepositoryImpl(
    remoteDataSource: sl(),
    // networkInfo: sl(),
  ));

  sl.registerFactory<ProductDetailRepository>(() => ProductDetailRepositoryImpl(
    remoteDataSource: sl(),
    // networkInfo: sl(),
  ));

  //Data Source
  sl.registerFactory<LoginRemoteDataSource>(
          () => LoginRemoteDataSourceImpl(dio: sl()));
  sl.registerFactory<ProductListRemoteDataSource>(
          () => ProductListRemoteDataSourceImpl(dio: sl()));
  sl.registerFactory<ProductDetailRemoteDataSource>(
          () => ProductDetailRemoteDataSourceImpl(dio: sl()));

  final dio = Dio(BaseOptions(baseUrl: EndPointConfig.baseUrl));
  dio.interceptors.add(LogInterceptor(
    responseBody: true,
    requestBody: true,
    requestHeader: true,
    error: true,
  ));
  sl.registerFactory(() => dio);

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() async => sharedPreferences);
}
