import 'package:flutter/material.dart';
import 'package:flutter_important/business_logic/providers/counter_provider.dart';
import 'package:flutter_important/presentation/styles/colors.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProviderCounter extends StatefulWidget {
  const ProviderCounter({Key? key}) : super(key: key);

  @override
  State<ProviderCounter> createState() => _ProviderCounterState();
}

class _ProviderCounterState extends State<ProviderCounter> {

  late CounterProvider providerForData;
  late CounterProvider providerForMethods;

  @override
  void didChangeDependencies() {
    providerForMethods = Provider.of<CounterProvider>(context, listen: false);
    providerForData = Provider.of<CounterProvider>(context, listen: true);
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
                  onPressed: context.read<CounterProvider>().decrementCounter,
                  backgroundColor: darkSkyBlue,
                  child: const Icon(
                    Icons.remove,
                    color: white,
                  ),
                ),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 5.w),
                    child: DefaultText(
                text: '${providerForMethods.counter}',
                weight: FontWeight.bold,
                textSize: 25.sp,
                    ),
                  ),
                FloatingActionButton(
                  onPressed: providerForData.incrementCounter,
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
