import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FocusNode _focusNode = FocusNode();

  void _confirmExit() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('Deseja realmente sair do aplicativo?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => SystemNavigator.pop(),
            child: const Text('Sair'),
          ),
        ],
      ),
    );
  }
  Future<bool> _onWillPop() async {
    _confirmExit();
    return false;
  }

  // Função para tratar a tecla ESC
  void _handleKeyEscape(RawKeyEvent event) {
    if (event.logicalKey == LogicalKeyboardKey.escape) {
      _confirmExit();
    }
  }

  @override
  void initState() {
    super.initState();
    _focusNode.requestFocus();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: RawKeyboardListener(
        focusNode: _focusNode,
        autofocus: true,
        onKey: _handleKeyEscape,
        child: Scaffold(

        ),
      ),
    );
  }
}