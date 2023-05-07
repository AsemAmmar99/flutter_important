import 'package:flutter/material.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:sizer/sizer.dart';

import '../../data/models/users_response.dart';

class UsersListItem extends StatelessWidget {

  final User userModel;

  const UsersListItem({Key? key, required this.userModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: 10.h,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(userModel.avatar),
        ),
        title: DefaultText(text: '${userModel.firstName} ${userModel.lastName}'),
        subtitle: DefaultText(text: userModel.email,),
        trailing: DefaultText(text: userModel.id.toString(),),
      ),
    );
  }
}
