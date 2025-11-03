// Arquivo gerado automaticamente
import 'package:flutter/material.dart';
import '{{base}}_controller.dart';

class {{Class}}Page extends StatefulWidget {
  const {{Class}}Page({super.key});

  @override
  State<{{Class}}Page> createState() => _{{Class}}PageState();
}

class _{{Class}}PageState extends State<{{Class}}Page> {
  late final {{Class}}Controller controller;

  @override
  void initState() {
    super.initState();
    // Inicialize seu controller aqui
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('{{Class}}')),
      body: const Center(
        child: Text('Página de {{Class}}'),
      ),
    );
  }
}
