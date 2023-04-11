import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_important/business_logic/counter_cubit/counter_cubit.dart';
import 'package:flutter_important/presentation/styles/colors.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

class BlocCounter extends StatefulWidget {
  const BlocCounter({Key? key}) : super(key: key);

  @override
  State<BlocCounter> createState() => _BlocCounterState();
}

class _BlocCounterState extends State<BlocCounter> {
  late CounterCubit cubit;

  @override
  void didChangeDependencies() {
    cubit = CounterCubit.get(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: cubit.decrementCounter,
                  backgroundColor: darkSkyBlue,
                  child: const Icon(
                    Icons.remove,
                    color: white,
                  ),
                ),
                BlocConsumer<CounterCubit, CounterStates>(
                  listener: (context, state) {
                    if(state is IncreaseCounterState){
                      Fluttertoast.showToast(
                          msg: "Counter Increased!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.sp);
                    }else if(state is DecreaseCounterState){
                      Fluttertoast.showToast(
                          msg: "Counter Decreased!",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 3,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.sp);
                    }
                  },
                  builder: (context, state) {
                    switch(state.runtimeType){
                      case IncreaseCounterState:
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: DefaultText(
                            text: '${cubit.counter}',
                            weight: FontWeight.bold,
                            textSize: 25.sp,
                            textColor: Colors.green,
                          ),
                        );
                      case DecreaseCounterState:
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: DefaultText(
                            text: '${cubit.counter}',
                            weight: FontWeight.bold,
                            textSize: 25.sp,
                            textColor: Colors.red,
                          ),
                        );
                      default:
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: DefaultText(
                            text: '${cubit.counter}',
                            weight: FontWeight.bold,
                            textSize: 25.sp,
                          ),
                        );
                    }
                  },
                ),
                FloatingActionButton(
                  onPressed: cubit.incrementCounter,
                  backgroundColor: darkSkyBlue,
                  child: const Icon(
                    Icons.add,
                    color: white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
