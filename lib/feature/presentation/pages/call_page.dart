// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone_app/feature/presentation/pages/sub_pages/single_item_call_page.dart';
import 'package:whatsapp_clone_app/feature/presentation/widgets/theme/style.dart';

class CallPage extends StatelessWidget {
  const CallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => SingleItemCallPage(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: primaryColor,
        child: Icon(Icons.add_call, color: Colors.white),
      ),
    );
  }
}
