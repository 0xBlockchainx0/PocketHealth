import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocket_health/bloc/adult_unwell/adultUnwellBloc.dart';
import 'package:pocket_health/bloc/emergency_contact/emergencyContactBloc.dart';
import 'package:pocket_health/bloc/hotlines/hotlinesBloc.dart';
import 'package:pocket_health/bloc/login/loginBloc.dart';
import 'package:pocket_health/bloc/organs/organsBloc.dart';
import 'package:pocket_health/bloc/practitioner_profile/practitionerProfileBloc.dart';
import 'package:pocket_health/bloc/profile/userProfileBloc.dart';
import 'package:pocket_health/repository/adultUnwellRepo.dart';
import 'package:pocket_health/repository/conditionDetailRepo.dart';
import 'package:pocket_health/repository/emergencyContactRepo.dart';
import 'package:pocket_health/repository/forgotPasswordRepo.dart';
import 'package:pocket_health/repository/hotline_repo.dart';
import 'package:pocket_health/repository/loginRepo.dart';
import 'package:pocket_health/repository/organsRepo.dart';
import 'package:pocket_health/repository/practitionerProfileRepo.dart';
import 'package:pocket_health/repository/userProfile_repo.dart';
import 'package:pocket_health/screens/boarding/splash_screen.dart';
import 'package:pocket_health/services/api_service.dart';
import 'package:http/http.dart' as http;
import 'package:pocket_health/simple_bloc_observer.dart';
import 'bloc/conditionDetails/conditionDetailsBloc.dart';
import 'bloc/forgotPassword/forgotPasswordBloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final LoginRepository loginRepository = LoginRepository(
    ApiService(
      http.Client(),
    ),
  );
  final UserProfileRepo userProfileRepo = UserProfileRepo(ApiService(http.Client()));
  final ForgotPasswordRepo forgotPasswordRepo = ForgotPasswordRepo(
      ApiService(
          http.Client(),
      ),
  );
  final PractitionerProfileRepo practitionerProfileRepo = PractitionerProfileRepo(ApiService(http.Client()),);
  final EmergencyContactRepo emergencyContactRepo = EmergencyContactRepo(ApiService(http.Client()),);
  final HotlineRepo hotlineRepo = HotlineRepo(ApiService(http.Client()),);
  final ConditionDetailsRepo conditionDetailsRepo = ConditionDetailsRepo(ApiService(http.Client()),);
  final AdultUnwellRepo unwellRepo = AdultUnwellRepo(ApiService(http.Client()),);
  final OrgansRepo organsRepo = OrgansRepo(ApiService(http.Client()),);
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp(
    forgotPasswordRepo: forgotPasswordRepo,
    loginRepository: loginRepository,
    userProfileRepo:userProfileRepo,
    practitionerProfileRepo:practitionerProfileRepo,
    emergencyContactRepo:emergencyContactRepo,
    hotlinesRepo:hotlineRepo,
    adultUnwellRepo: unwellRepo,
    conditionDetailsRepo: conditionDetailsRepo,
    organsRepo: organsRepo,
  ));
}

class MyApp extends StatelessWidget {
  final ForgotPasswordRepo forgotPasswordRepo;
  final LoginRepository loginRepository;
  final UserProfileRepo userProfileRepo;
  final PractitionerProfileRepo practitionerProfileRepo;
  final EmergencyContactRepo emergencyContactRepo;
  final HotlineRepo hotlinesRepo;
  final ConditionDetailsRepo conditionDetailsRepo;
  final AdultUnwellRepo adultUnwellRepo;
  final OrgansRepo organsRepo;
  const MyApp({Key key, @required this.forgotPasswordRepo,@required this.adultUnwellRepo,@required this.organsRepo,
    @required this.hotlinesRepo,@required this.loginRepository,
    @required this.emergencyContactRepo,@required this.userProfileRepo,@required this.conditionDetailsRepo,@required this.practitionerProfileRepo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 736),
      allowFontScaling: false,
      builder: () => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => ForgotPasswordBloc(forgotPasswordRepo: forgotPasswordRepo)),
          BlocProvider(create: (context) => LoginBloc(loginRepository: loginRepository)),
          BlocProvider(create: (context) => UserProfileBloc(userProfileRepo: userProfileRepo)),
          BlocProvider(create: (context) => PractitionerProfileBloc(practitionerProfileRepo: practitionerProfileRepo)),
          BlocProvider(create: (context) => EmergencyContactBloc(emergencyContactRepo: emergencyContactRepo)),
          BlocProvider(create: (context) => HotlinesBloc(hotlinesRepo: hotlinesRepo)),
          BlocProvider(create: (context) => ConditionDetailsBloc(conditionDetailsRepo: conditionDetailsRepo)),
          BlocProvider(create: (context) => AdultUnwellBloc(adultUnwellRepo: adultUnwellRepo),),
          BlocProvider(create: (context) => OrgansBloc(organsRepo: organsRepo),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Ssential App',
          theme: ThemeData(
            primaryColor: Colors.white,
            scaffoldBackgroundColor: Colors.white
          ),

          home: SplashScreen(),

        ),
      ),
    );
  }

}




