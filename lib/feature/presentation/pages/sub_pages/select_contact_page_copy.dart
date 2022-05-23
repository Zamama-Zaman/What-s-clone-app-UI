// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_app/feature/domain/entities/user_entity.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/auth/cubit/auth_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/get_device_number/cubit/get_device_numbers_cubit.dart';

class SelectedContactPageCopy extends StatefulWidget {
  final UserEntity userInfo;
  const SelectedContactPageCopy({Key? key, required this.userInfo})
      : super(key: key);

  @override
  State<SelectedContactPageCopy> createState() =>
      _SelectedContactPageCopyState();
}

class _SelectedContactPageCopyState extends State<SelectedContactPageCopy> {
  @override
  void initState() {
    // BlocProvider.of<AuthCubit>(context).getCurrentUidUseCase();
    BlocProvider.of<GetDeviceNumbersCubit>(context).getDeviceNumbers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${widget.userInfo.name}',
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Online: ${widget.userInfo.isOnline}',
            ),
            SizedBox(
              height: 20,
            ),
            Text('Phone Number: ${widget.userInfo.phoneNumber}'),
          ],
        ),
      ),
    );
  }
}
