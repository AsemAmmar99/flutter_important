import 'package:flutter/material.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  final String myName;

  const HomeScreen({Key? key, required this.myName}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.teal,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(Icons.more_vert_outlined),
        ),
      ),
      drawer: Drawer(
        backgroundColor: Colors.deepPurple,
        width: 60.w,
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 3.h),
              child: DrawerHeader(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                    children: [
                  const Icon(Icons.supervised_user_circle),
                  DefaultText(
                    text: 'Asem',
                    textSize: 20.sp,
                  ),
                  const Expanded(child: Divider(height: 1, color: Colors.white,))
                ]),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: DefaultText(text: 'Settings', textSize: 10.sp,),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: DefaultText(text: 'Favourites', textSize: 10.sp,),
              trailing: const Icon(Icons.arrow_forward_ios_outlined),
            ),
          ],
        ),
      ),
      // appBar: AppBar(
      //   leading: IconButton(
      //     onPressed: () => Navigator.pop(context),
      //     icon: const Icon(Icons.arrow_back_ios),
      //   ),
      //   title: const Text('Home Screen'),
      //   centerTitle: true,
      //   actions: const [
      //     Icon(Icons.menu),
      //     Padding(
      //       padding: EdgeInsets.symmetric(horizontal: 6),
      //       child: Icon(Icons.settings),
      //     ),
      //   ],
      // ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 4000),
                tween: ColorTween(begin: Colors.transparent, end: Colors.red),
                builder: (context, Color? value, child) => Flexible(
                  child: Container(
                    width: 100.w,
                    color: value,
                  ),
                ),
              ),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 4000),
                tween: ColorTween(begin: Colors.transparent, end: Colors.white),
                builder: (context, Color? value, child) => Flexible(
                  child: Container(
                    width: 100.w,
                    color: value,
                  ),
                ),
              ),
              TweenAnimationBuilder(
                duration: const Duration(milliseconds: 4000),
                tween: ColorTween(begin: Colors.transparent, end: Colors.black),
                builder: (context, Color? value, child) => Flexible(
                  child: Container(
                    width: 100.w,
                    color: value,
                  ),
                ),
              ),
            ],
          ),
          Center(
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
        ],
      ),
    );
  }
}
