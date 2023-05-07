import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_important/core/my_cache_keys.dart';
import 'package:flutter_important/data/data_source/local/my_cache.dart';
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

  late Color backgroundColor = colors[MyCache.getInt(key: MyCacheKeys.selectedColorIndex)];

  void changeBackgroundToSelected(int index){
    backgroundColor = colors[index];
    MyCache.putInt(key: MyCacheKeys.selectedColorIndex, value: index);
    emit(ColorSelectedState());
  }
}