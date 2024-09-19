import 'package:doctor_app/core/di/dependency_injection.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/doc_app.dart';
import 'package:doctor_app/features/bloc_observer/bloc_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
<<<<<<< HEAD
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
  await ScreenUtil.ensureScreenSize();
=======
  //To fix text being hidden bug in flutter screenutil in release mode
  await ScreenUtil.ensureScreenSize();
  await setupGetIt();
>>>>>>> f6f197c7d22d7cd47ee9764649325ec9d7baee58
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
