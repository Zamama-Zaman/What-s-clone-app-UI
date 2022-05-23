// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/widgets/theme/style.dart';

class SetInitialProfileImage extends StatefulWidget {
  final String phoneNumber;
  const SetInitialProfileImage({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<SetInitialProfileImage> createState() => _SetInitialProfileImageState();
}

class _SetInitialProfileImageState extends State<SetInitialProfileImage> {
  String get _phoneNumber => widget.phoneNumber;
  TextEditingController _nameController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 40,
          ),
          child: Column(
            children: [
              Text(
                'Profile Info',
                style: TextStyle(
                  color: greenColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Please provide your name and an optional Profile photo',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _rowWidget(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    color: greenColor,
                    onPressed: _submitProfileInfo,
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _rowWidget() {
    return Container(
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Icon(Icons.camera_alt),
          ),
          SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Enter you name',
              ),
            ),
          ),
          SizedBox(width: 8),
          Container(
            width: 35,
            height: 35,
            decoration: BoxDecoration(
              color: textIconColorGray,
              borderRadius: BorderRadius.all(
                Radius.circular(
                  25,
                ),
              ),
            ),
            child: Icon(Icons.insert_emoticon),
          ),
        ],
      ),
    );
  }

  void _submitProfileInfo() {
    if (_nameController.text.isNotEmpty) {
      BlocProvider.of<PhoneAuthCubit>(context).submitProfileInfo(
          profileUrl: "",
          phoneNumber: _phoneNumber,
          name: _nameController.text);
    }
  }
}
