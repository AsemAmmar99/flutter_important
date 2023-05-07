import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_important/business_logic/colors_cubit/colors_cubit.dart';
import 'package:flutter_important/presentation/widgets/default_material_button.dart';
import 'package:sizer/sizer.dart';

class ColorsPaletteScreen extends StatefulWidget {
  const ColorsPaletteScreen({Key? key}) : super(key: key);

  @override
  State<ColorsPaletteScreen> createState() => _ColorsPaletteScreenState();
}

class _ColorsPaletteScreenState extends State<ColorsPaletteScreen> {
  late ColorsCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = ColorsCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          BlocBuilder<ColorsCubit, ColorsState>(
            builder: (context, state) {
              return Ink(
                height: 100.h,
                width: 100.w,
                color: cubit.backgroundColor,
              );
            },
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.h),
            padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(15.sp),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
            ),
            child: BlocBuilder<ColorsCubit, ColorsState>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: DefaultMaterialButton(
                        onPressed: () => cubit.changeBackgroundToSelected(0),
                        backgroundColor: cubit.colors.elementAt(0),
                        child: Visibility(
                          visible: cubit.backgroundColor ==
                              cubit.colors.elementAt(0),
                          child: const Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: DefaultMaterialButton(
                        onPressed: () => cubit.changeBackgroundToSelected(1),
                        backgroundColor: cubit.colors.elementAt(1),
                        child: Visibility(
                          visible: cubit.backgroundColor ==
                              cubit.colors.elementAt(1),
                          child: const Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: DefaultMaterialButton(
                        onPressed: () => cubit.changeBackgroundToSelected(2),
                        backgroundColor: cubit.colors.elementAt(2),
                        child: Visibility(
                          visible: cubit.backgroundColor ==
                              cubit.colors.elementAt(2),
                          child: const Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: DefaultMaterialButton(
                        onPressed: () => cubit.changeBackgroundToSelected(3),
                        backgroundColor: cubit.colors.elementAt(3),
                        child: Visibility(
                          visible: cubit.backgroundColor ==
                              cubit.colors.elementAt(3),
                          child: const Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Expanded(
                      flex: 2,
                      child: DefaultMaterialButton(
                        onPressed: () => cubit.changeBackgroundToSelected(4),
                        backgroundColor: cubit.colors.elementAt(4),
                        child: Visibility(
                          visible: cubit.backgroundColor ==
                              cubit.colors.elementAt(4),
                          child: const Icon(
                            Icons.check_circle_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
