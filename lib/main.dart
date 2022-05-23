import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_app/feature/data/model/user_model.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/auth/cubit/auth_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/communication/cubit/communication_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/get_device_number/cubit/get_device_numbers_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/my_chat/cubit/my_chat_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/screens/home_screen.dart';
import 'package:whatsapp_clone_app/feature/presentation/screens/welcome_screen.dart';
import 'injection_container.dart' as di;
import 'package:whatsapp_clone_app/feature/presentation/widgets/theme/style.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => di.sl<AuthCubit>()..appStarted(),
        ),
        BlocProvider(
          create: (_) => di.sl<PhoneAuthCubit>(),
        ),
        BlocProvider<UserCubit>(
          create: (_) => di.sl<UserCubit>()..getAllUsers(),
        ),
        BlocProvider<GetDeviceNumbersCubit>(
          create: (_) => di.sl<GetDeviceNumbersCubit>(),
        ),
        BlocProvider<CommunicationCubit>(
          create: (_) => di.sl<CommunicationCubit>(),
        ),
        BlocProvider<MyChatCubit>(
          create: (_) => di.sl<MyChatCubit>(),
        )
      ],
      child: MaterialApp(
        title: 'Whatsapp Clone App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: primaryColor,
        ),
        routes: {
          "/": (context) {
            return BlocBuilder<AuthCubit, AuthState>(
              builder: (context, authState) {
                if (authState is Authenticated) {
                  return BlocBuilder<UserCubit, UserState>(
                    builder: (context, userState) {
                      if (userState is UserLoaded) {
                        final currentUserInfo = userState.users.firstWhere(
                            (user) => user.uid == authState.uid,
                            orElse: () => UserModel());
                        return HomeScreen(
                          userInfo: currentUserInfo,
                        );
                      }
                      return Container();
                    },
                  );
                }
                if (authState is UnAuthenticated) {
                  return const WelcomeScreen();
                }
                return Container();
              },
            );
          }
        },
      ),
    );
  }
}
