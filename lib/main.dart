import 'package:flutter/material.dart';
import 'package:meeting_room/core/app_routes.dart';
import 'pages/home/login_page.dart';
import 'pages/meeting_list/meeting_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      title: 'Meeting Room',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        
      ),
      home: const LoginPage(
        
      ),
      routes: {
        AppRoutes.meetingRoom: (context) {
          return const MeetingPage();
        },
      },
    );
  }
}
