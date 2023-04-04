import 'package:flutter/material.dart';
import 'package:flutter_important/presentation/styles/colors.dart';
import 'package:sizer/sizer.dart';

import '../../views/whatsapp_chats_list_item.dart';
import '../../widgets/default_divider.dart';

class WhatsappChatsScreen extends StatelessWidget {
  const WhatsappChatsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 3.w),
      child: ListView.separated(
          itemBuilder: (context, index) => const WhatsappChatsListItem(),
          separatorBuilder: (context, index) => const DefaultDivider(),
          itemCount: 10,
      ),
    );
  }
}
