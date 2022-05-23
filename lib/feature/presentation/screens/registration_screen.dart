// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_string_interpolations, sized_box_for_whitespace, prefer_final_fields

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone_app/feature/data/model/user_model.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/auth/cubit/auth_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/phone_auth/cubit/phone_auth_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/bloc/user/cubit/user_cubit.dart';
import 'package:whatsapp_clone_app/feature/presentation/pages/phone_verification_page.dart';
import 'package:whatsapp_clone_app/feature/presentation/pages/set_initial_profile_image.dart';
import 'package:whatsapp_clone_app/feature/presentation/screens/home_screen.dart';
import 'package:whatsapp_clone_app/feature/presentation/widgets/theme/style.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  static Country _selectedFilteredDilogCountry =
      CountryPickerUtils.getCountryByPhoneCode('92');
  String _countryCode = _selectedFilteredDilogCountry.phoneCode;

  TextEditingController _phoneAuthController = TextEditingController();

  String _phoneNumber = "";

  @override
  void dispose() {
    _phoneAuthController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PhoneAuthCubit, PhoneAuthState>(
      builder: (context, phoneAuthState) {
        if (phoneAuthState is PhoneAuthSmsCodeReceived) {
          return PhoneVerificationPage(
            phoneNumber: "+$_countryCode${_phoneAuthController.text}",
          );
        }
        if (phoneAuthState is PhoneAuthProfileInfo) {
          return SetInitialProfileImage(
            phoneNumber: "+$_countryCode${_phoneAuthController.text}",
          );
        }
        if (phoneAuthState is PhoneAuthLoading) {
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        if (phoneAuthState is PhoneAuthSuccess) {
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
              return Container();
            },
          );
        }
        return _bodyWidget();
      },
      listener: (context, phoneAuthState) {
        if (phoneAuthState is PhoneAuthSuccess) {
          BlocProvider.of<AuthCubit>(context).loggedIn();
        }
        if (phoneAuthState is PhoneAuthFailure) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Something is wrong"),
                  Icon(Icons.error_outline)
                ],
              ),
            ),
          ));
        }
      },
    );
  }

  Widget _bodyWidget() {
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
              ListTile(
                onTap: _openFilteredCountryPickerDialog,
                title: _buildDialogItem(_selectedFilteredDilogCountry),
              ),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.50,
                          color: greenColor,
                        ),
                      ),
                    ),
                    width: 80,
                    height: 40,
                    alignment: Alignment.center,
                    child: Text('${_selectedFilteredDilogCountry.phoneCode}'),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Container(
                      height: 40,
                      child: TextField(
                        controller: _phoneAuthController,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: MaterialButton(
                    color: greenColor,
                    onPressed: _submitVerifyPhoneNumber,
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

  void _openFilteredCountryPickerDialog() {
    showDialog(
        context: context,
        builder: (context) => Theme(
              data: Theme.of(context).copyWith(
                primaryColor: primaryColor,
              ),
              child: CountryPickerDialog(
                titlePadding: EdgeInsets.all(8.0),
                searchCursorColor: Colors.black,
                searchInputDecoration: InputDecoration(
                  hintText: 'Search',
                ),
                isSearchable: true,
                title: Text('Select your phone code'),
                onValuePicked: (Country country) {
                  setState(() {
                    _selectedFilteredDilogCountry = country;
                    _countryCode = country.phoneCode;
                  });
                },
                itemBuilder: _buildDialogItem,
              ),
            ));
  }

  Widget _buildDialogItem(Country country) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greenColor, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(height: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(height: 8.0),
          Text("${country.name}"),
          Spacer(),
          Icon(Icons.arrow_drop_down),
        ],
      ),
    );
  }

  void _submitVerifyPhoneNumber() {
    if (_phoneAuthController.text.isNotEmpty) {
      _phoneNumber = "+$_countryCode${_phoneAuthController.text}";
      print(_phoneNumber);
      BlocProvider.of<PhoneAuthCubit>(context).submitVerifyPhoneNumber(
        phoneNumber: _phoneNumber,
      );
    }
  }
}
