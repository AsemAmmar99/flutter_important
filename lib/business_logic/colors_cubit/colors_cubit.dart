import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_important/presentation/styles/colors.dart';

part 'colors_state.dart';

class ColorsCubit extends Cubit<ColorsState> {
  ColorsCubit() : super(ColorsInitialState());

  static ColorsCubit get(context) => BlocProvider.of<ColorsCubit>(context);

  List<Color> colors = [
    lightBrown,
    darkPurple,
    lightRed,
    lightSkyBlue,
    darkSkyBlue
  ];

  late Color backgroundColor = colors.first;
}
