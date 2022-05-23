// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/widgets/theme/style.dart';

class PhoneVerificationPage extends StatefulWidget {
  final String phoneNumber;
  const PhoneVerificationPage({Key? key, required this.phoneNumber})
      : super(key: key);

  @override
  State<PhoneVerificationPage> createState() => _PhoneVerificationPageState();
}

class _PhoneVerificationPageState extends State<PhoneVerificationPage> {
  String get _phoneNumber => widget.phoneNumber;
  final TextEditingController _pinCodeController = TextEditingController();

  // @override
  // void dispose() {
  //   _pinCodeController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(''),
                  Text(
                    'Verify your phone number',
                    style: TextStyle(
                      fontSize: 18,
                      color: greenColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Icon(Icons.more_vert),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'WhatsApp Clone will send and SMS message (carrier charges may apply) to verify your phone number. Enter your country code and phone number:',
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _pinCodeWidge(),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    color: greenColor,
                    onPressed: _submitSmsCode,
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

  Widget _pinCodeWidge() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(
            horizontal: 50,
          ),
          child: PinCodeTextField(
            appContext: context,
            controller: _pinCodeController,
            length: 6,
            obscureText: true,
            onChanged: (pinCode) {
              print(pinCode);
            },
          ),
        ),
        Text('Enter your 6 digit code'),
      ],
    );
  }

  void _submitSmsCode() {
    if (_pinCodeController.text.isNotEmpty) {
      BlocProvider.of<PhoneAuthCubit>(context)
          .submitSmsCode(smsCode: _pinCodeController.text);
    }
  }
}
