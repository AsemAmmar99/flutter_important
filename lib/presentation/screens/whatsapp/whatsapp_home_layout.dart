import 'package:flutter/material.dart';
import 'package:flutter_important/presentation/screens/whatsapp/whatsapp_chats_screen.dart';
import 'package:flutter_important/presentation/styles/colors.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

class WhatsappHomeLayout extends StatefulWidget {
  const WhatsappHomeLayout({Key? key}) : super(key: key);

  @override
  State<WhatsappHomeLayout> createState() => _WhatsappHomeLayoutState();
}

class _WhatsappHomeLayoutState extends State<WhatsappHomeLayout>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(
      length: 4,
      initialIndex: 1,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          headerSliverBuilder: (context, value) => [
            SliverAppBar(
              backgroundColor: barsColor,
              title: const DefaultText(
                text: 'WhatsApp',
                textColor: textsColor,
              ),
              pinned: true,
              floating: true,
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.camera_alt_outlined,
                      color: textsColor,
                    ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.search,
                    color: textsColor,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.more_vert,
                    color: textsColor,
                  ),
                ),
              ],
              bottom: TabBar(
                isScrollable: true,
                indicatorColor: floatingActionButtonColor,
                labelColor: floatingActionButtonColor,
                controller: tabController,
                unselectedLabelColor: textsColor,
                tabs: [
                  Container(
                    alignment: AlignmentDirectional.centerStart,
                    child: const Tab(
                      child: Icon(Icons.groups),
                    ),
                  ),
                  Container(
                    width: 19.w,
                    alignment: AlignmentDirectional.center,
                    child: const Tab(
                      text: 'Chats',
                    ),
                  ),
                  Container(
                    width: 19.w,
                    alignment: AlignmentDirectional.center,
                    child: const Tab(
                      text: 'Status',
                    ),
                  ),
                  Container(
                    width: 19.w,
                    alignment: AlignmentDirectional.center,
                    child: const Tab(
                      text: 'Calls',
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: TabBarView(
            controller: tabController,
              children: const [
                FlutterLogo(),
                WhatsappChatsScreen(),
                FlutterLogo(),
                FlutterLogo(),
              ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        backgroundColor: floatingActionButtonColor,
        child: const RotatedBox(
            quarterTurns: 2,
        child: Icon(Icons.chat),
        ),
      ),
    );
  }
}
