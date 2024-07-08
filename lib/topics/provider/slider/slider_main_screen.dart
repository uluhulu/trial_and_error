import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';
import 'package:trial_and_error/topics/provider/slider/state_managment/slider_notifier.dart';

class SliderMainScreen extends StatelessWidget {
  const SliderMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SliderNotifier(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Chart And Slider'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyChart(),
            const SizedBox(
              height: 20,
            ),
            const MySlider(),
          ],
        ),
      ),
    );
  }
}

class MyChart extends StatelessWidget {
  MyChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<SliderNotifier>(
      builder: (BuildContext context, SliderNotifier value, _) {
        return PieChart(dataMap: _generateDataMap(value.stateManagerValue));
      },
    );
  }

  Map<String, double> _generateDataMap(double value) {
    Map<String, double> dataMap = {
      "State Managment": 100 * value,
      "BackEnd": (100 * (1 - value)) / 3,
      "UI": (100 * (1 - value)) / 3,
      "UX": (100 * (1 - value)) / 3,
    };
    return dataMap;
  }
}

class MySlider extends StatelessWidget {
  const MySlider({super.key});

  @override
  Widget build(BuildContext context) {
    var sliderNotifier = Provider.of<SliderNotifier>(context);
    return Slider(
        value: sliderNotifier.stateManagerValue,
        min: 0,
        max: 1,
        onChanged: (newValue) {
          sliderNotifier.changeStateManagerValue(newValue);
        });
  }
}
