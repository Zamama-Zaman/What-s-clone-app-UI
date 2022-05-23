// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:whatsapp_clone_app/feature/domain/entities/user_entity.dart';
import 'package:whatsapp_clone_app/feature/presentation/pages/sub_pages/select_contact_page.dart';
import 'package:whatsapp_clone_app/feature/presentation/pages/sub_pages/select_contact_page_copy.dart';
import 'package:whatsapp_clone_app/feature/presentation/widgets/theme/style.dart';

class ChatPage extends StatefulWidget {
  final UserEntity userInfo;
  const ChatPage({Key? key, required this.userInfo}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: greenColor.withOpacity(.5),
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: Icon(
              Icons.message,
              color: Colors.white.withOpacity(.6),
              size: 40,
            ),
          ),
          Align(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'Start chat with your friends and family, \n on Whatsapp Clone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.4),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => SelectedContactPageCopy(
          //       userInfo: widget.userInfo,
          //     ),
          //   ),
          // );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  SelectContactPage(userInfo: widget.userInfo),
            ),
          );
        },
        child: Icon(Icons.chat),
      ),
    );
  }

  // Widget _myChatList() {
  //   return Expanded(
  //     child: ListView.builder(
  //       itemBuilder: (context, index) => SingleItemChatUserPage(
  //         name: 'Zamama',
  //         recentSendMessage: 'Nothing',
  //         time: '12:30 am',
  //       ),
  //     ),
  //   );
  // }
}
