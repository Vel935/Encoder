import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../views/widgets/overpower.dart';

class GeneratorPage extends StatefulWidget {
  const GeneratorPage({super.key});

  @override
  State<GeneratorPage> createState() => _GeneratorPageState();
}

class _GeneratorPageState extends State<GeneratorPage> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [OverPower()],
    );
  }
}
