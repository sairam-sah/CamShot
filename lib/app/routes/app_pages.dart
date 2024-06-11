import 'package:camshot/app/models/home/views/home_view.dart';
import 'package:get/get.dart';

import '../models/home/bindings/home_binding.dart';
// import '../modules/change_password/bindings/change_password_binding.dart';
// import '../modules/change_password/views/change_password_view.dart';
// import '../modules/dashboard/bindings/dashboard_binding.dart';
// import '../modules/dashboard/views/dashboard_view.dart';
// import '../modules/forget_password/bindings/forget_password_binding.dart';
// import '../modules/forget_password/views/forget_password_view.dart';
// import '../modules/home/bindings/home_binding.dart';
// import '../modules/home/views/home_view.dart';
// import '../modules/otp/bindings/otp_binding.dart';
// import '../modules/otp/views/otp_view.dart';
// import '../modules/questions/bindings/questions_binding.dart';
// import '../modules/questions/views/questions_view.dart';
// import '../modules/signin/bindings/signin_binding.dart';
// import '../modules/signin/views/signin_view.dart';
// import '../modules/signup/bindings/signup_binding.dart';
// import '../modules/signup/views/signup_view.dart';
// import '../modules/splash/bindings/splash_binding.dart';
// import '../modules/splash/views/splash_view.dart';
// import '../modules/study_course/bindings/study_course_binding.dart';
// import '../modules/study_course/views/study_course_view.dart';
// import '../modules/test/bindings/test_binding.dart';
// import '../modules/test/views/test_view.dart';
// import '../modules/test_complete/bindings/test_complete_binding.dart';
// import '../modules/test_complete/views/test_complete_view.dart';
// import '../modules/test_history/bindings/test_history_binding.dart';
// import '../modules/test_history/views/test_history_view.dart';
// import '../modules/trafic_signs/bindings/trafic_signs_binding.dart';
// import '../modules/trafic_signs/views/trafic_signs_view.dart';
// import '../modules/verify/bindings/verify_binding.dart';
// import '../modules/verify/views/verify_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    // GetPage(
    //   name: _Paths.SPLASH,
    //   page: () => const SplashView(),
    //   binding: SplashBinding(),
    // ),
    // GetPage(
    //   name: _Paths.QUESTIONS,
    //   page: () => const QuestionsView(),
    //   binding: QuestionsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.TEST,
    //   page: () => const TestView(),
    //   binding: TestBinding(),
    // ),
    // GetPage(
    //   name: _Paths.TEST_COMPLETE,
    //   page: () => const TestCompleteView(),
    //   binding: TestCompleteBinding(),
    // ),
    // GetPage(
    //   name: _Paths.TEST_HISTORY,
    //   page: () => const TestHistoryView(),
    //   binding: TestHistoryBinding(),
    // ),
    // GetPage(
    //   name: _Paths.STUDY_COURSE,
    //   page: () => const StudyCourseView(),
    //   binding: StudyCourseBinding(),
    // ),
    // GetPage(
    //   name: _Paths.TRAFIC_SIGNS,
    //   page: () => const TraficSignsView(),
    //   binding: TraficSignsBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SIGNIN,
    //   page: () => const SigninView(),
    //   binding: SigninBinding(),
    // ),
    // GetPage(
    //   name: _Paths.SIGNUP,
    //   page: () => const SignupView(),
    //   binding: SignupBinding(),
    // ),
    // GetPage(
    //   name: _Paths.FORGET_PASSWORD,
    //   page: () => const ForgetPasswordView(),
    //   binding: ForgetPasswordBinding(),
    // ),
    // GetPage(
    //   name: _Paths.OTP,
    //   page: () => const OtpView(),
    //   binding: OtpBinding(),
    // ),
    // GetPage(
    //   name: _Paths.CHANGE_PASSWORD,
    //   page: () => const ChangePasswordView(),
    //   binding: ChangePasswordBinding(),
    // ),
    // GetPage(
    //   name: _Paths.VERIFY,
    //   page: () => const VerifyView(),
    //   binding: VerifyBinding(),
    // ),
    // GetPage(
    //   name: _Paths.DASHBOARD,
    //   page: () => const DashboardView(),
    //   binding: DashboardBinding(),
    // ),
  ];
}
