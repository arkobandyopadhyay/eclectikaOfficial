import 'package:eclectika23_official_app/Screens/MadAds/MadAds.dart';
import 'package:eclectika23_official_app/Screens/events/events_screen.dart';
import 'package:eclectika23_official_app/Screens/face_of_eclectika/face_of_eclectika_screen.dart';
import 'package:eclectika23_official_app/Screens/gallery/gallery_screen.dart';
import 'package:eclectika23_official_app/Screens/sponsors/sponsors_screen.dart';
import 'package:eclectika23_official_app/Screens/team/team_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'Screens/Home/cubit/homeCubit.dart';
import 'Screens/Home/home.dart';
import 'Screens/Home/network.dart';
import 'Screens/SplashScreen/cubit/splashScreenCubit.dart';
import 'Screens/SplashScreen/splashScreen.dart';
import 'Screens/SplashScreen/splashScreenNetwork.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Constants/colors.dart';
import 'Screens/Login/cubit/loginCubit.dart';
import 'Screens/SignUp/cubit/signUpCubit.dart';
import 'Screens/SignUp/signup.dart';
import 'Screens/Login/login.dart';
import 'package:provider/provider.dart';
import 'constants/strings.dart';
import 'Modals/global_state.dart';
import 'Screens/Login/loginNetwork.dart';
import 'Screens/SignUp/signUpNetwork.dart';
import 'Screens/Welcome/welcome.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Provider(
      create: (_)=> GlobalState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ECLECTIKA_23',
        routes: {
          S.routeSplash: (_) => BlocProvider(
              create: (_) => SplashScreenCubit(SplashNetwork()),
              child: SplashScreen()),
          S.routeWelcome: (_) => const Welcome(),
          S.routeMadAds: (_) => const MadAdsScreen(),
          S.routeEvents: (_) => const EventsScreen(),
          S.routeSponsors: (_) => const SponsorsScreen(),
          S.routeTeam: (_) => const TeamScreen(),
          S.routeFaceOfEclectika: (_) => const FaceOfEclectikaScreen(),
          S.routeGallery: (_) => const GalleryScreen(),
          S.routeHome: (_) => BlocProvider(
              create: (_) => HomeCubit(HomeNetwork()),
              child: Home()),
          S.routeLogin: (_) => BlocProvider(
              create: (_) => LoginCubit(FirebaseLogin()),
              child: Login()),
          S.routeSignup: (_) => BlocProvider(
              create: (_) => SignupCubit(FirebaseSignup()),
              child: SignUp()),
        },
        initialRoute: S.routeSplash,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: C.gradientColor3,
              secondary: C.buttonColor,
            )
        ),
        home: const Welcome(),
      ),
    );
  }
}
