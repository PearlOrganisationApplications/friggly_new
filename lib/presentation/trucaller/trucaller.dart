import 'package:flutter/material.dart';
import 'package:truecaller_sdk/truecaller_sdk.dart';

class MyTruCaller extends StatefulWidget {
  const MyTruCaller({super.key});

  @override
  State<MyTruCaller> createState() => _MyTruCallerState();
}

class _MyTruCallerState extends State<MyTruCaller> {
  late Stream<TruecallerSdkCallback>? _stream;

  void initState() {
    super.initState();
    _stream = TruecallerSdk.streamCallbackData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
