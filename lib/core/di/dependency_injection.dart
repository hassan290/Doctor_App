import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/api_constants.dart';
import 'package:doctor_app/core/networking/api_service.dart';
import 'package:doctor_app/core/networking/dio_factory.dart';
import 'package:doctor_app/features/login/data/remote/data_sources/login_repository_imp.dart';
import 'package:doctor_app/features/login/domain/repositories/login_repository.dart';
import 'package:doctor_app/features/login/domain/use_cases/login_usecase.dart';
import 'package:doctor_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:doctor_app/features/signup/data/repositories/signup_repository_implementation.dart';
import 'package:doctor_app/features/signup/domain/repositories/signup_repository.dart';
import 'package:doctor_app/features/signup/domain/use_cases/signup_usecase.dart';
import 'package:doctor_app/features/signup/presentation/manager/cubit/signup_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & Api Service:
  final Dio dio = await DioFactory().getDio(ApiConstants.apiBaseUrl);
  //Dio dio = DioFactoryClient.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //Repository:
  getIt.registerLazySingleton<LoginRepository>(
      () => LoginRepositoryImp(getIt()));
  getIt.registerLazySingleton<SignupRepository>(
      () => SignupRepositoryImp(getIt()));
  //UseCase:
  getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecase(getIt()));
  getIt.registerLazySingleton<SignupUsecase>(() => SignupUsecase(getIt()));
  //Cubit:
  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt()));
  getIt.registerFactory<SignupCubit>(()=> SignupCubit(getIt()));
}
