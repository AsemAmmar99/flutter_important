import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {

  final String myName;

  const HomeScreen({Key? key, required this.myName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text('Home Screen'),
        centerTitle: true,
        actions: const [
          Icon(Icons.menu),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.access_time_filled_sharp,
              size: 30.sp,
              color: Colors.deepOrange,
            ),
            Text(
              'My name is ${widget.myName}',
              style: TextStyle(fontSize: 18.sp),
            ),
            Icon(
              Icons.access_alarm_outlined,
              size: 30.sp,
              color: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
