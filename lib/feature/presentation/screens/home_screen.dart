// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:whatsapp_clone_app/feature/domain/entities/user_entity.dart';
import 'package:whatsapp_clone_app/feature/presentation/pages/call_page.dart';
import 'package:whatsapp_clone_app/feature/presentation/pages/camera_page.dart';
import 'package:whatsapp_clone_app/feature/presentation/pages/chat_page.dart';
import 'package:whatsapp_clone_app/feature/presentation/pages/status_page.dart';
import 'package:whatsapp_clone_app/feature/presentation/widgets/custome_tab_bar.dart';
import 'package:whatsapp_clone_app/feature/presentation/widgets/theme/style.dart';

class HomeScreen extends StatefulWidget {
  final UserEntity userInfo;
  const HomeScreen({
    Key? key,
    required this.userInfo,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isSearch = false;
  int _currentPageIndex = 1;
  final PageController _pageViewController = PageController(initialPage: 1);

  List<Widget> get _pages => [
        CameraPage(),
        ChatPage(
          userInfo: widget.userInfo,
        ),
        StatusPage(),
        CallPage(),
      ];

  _buildSearch() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.3),
              spreadRadius: 1,
              offset: Offset(0.0, 0.50))
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          prefixIcon: InkWell(
            onTap: () {
              setState(() {
                _isSearch = false;
              });
            },
            child: Icon(Icons.arrow_back),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _currentPageIndex != 0
            ? AppBar(
                elevation: 0.0,
                automaticallyImplyLeading: false,
                backgroundColor:
                    _isSearch == false ? primaryColor : Colors.transparent,
                title: _isSearch == false
                    ? Text('WhatsApp Clone')
                    : SizedBox(
                        height: 0.0,
                        width: 0.0,
                      ),
                flexibleSpace: _isSearch == false
                    ? SizedBox(
                        height: 0.0,
                        width: 0.0,
                      )
                    : _buildSearch(),
                actions: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        _isSearch = true;
                      });
                    },
                    child: Icon(Icons.search),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(Icons.more_vert),
                ],
              )
            : null,
        body: Column(
          children: [
            _isSearch == false
                ? _currentPageIndex != 0
                    ? CustomeTabBar(index: _currentPageIndex)
                    : SizedBox(width: 0.0, height: 0.0)
                : SizedBox(
                    height: 0.0,
                    width: 0.0,
                  ),
            Expanded(
                child: PageView.builder(
              itemCount: _pages.length,
              controller: _pageViewController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              itemBuilder: (context, index) => _pages[index],
            )),
          ],
        ),
      ),
    );
  }
}
