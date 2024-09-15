import 'package:dio/dio.dart';
import 'package:doctor_app/core/networking/api_constants.dart';
import 'package:doctor_app/core/networking/api_service.dart';
import 'package:doctor_app/core/networking/dio_factory.dart';
import 'package:doctor_app/features/login/data/remote/data_sources/login_repository_imp.dart';
import 'package:doctor_app/features/login/domain/repositories/login_repository.dart';
import 'package:doctor_app/features/login/domain/use_cases/login_usecase.dart';
import 'package:doctor_app/features/login/presentation/manager/cubit/login_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  //Dio & Api Service:
  final Dio dio=await DioFactory().getDio(ApiConstants.apiBaseUrl);
  //Dio dio = DioFactoryClient.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  //Repository:
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImp(getIt()));
  //UseCase:
  getIt.registerLazySingleton<LoginUsecase>(() => LoginUsecase(getIt()));
  //Cubit:
  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt()));
}
