import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
            onPressed: () {
              Navigator.pop(context);
              if (Platform.isAndroid) {
                SystemNavigator.pop();
              } else {
                exit(0);
              }
            },
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

  // Captura a tecla ESC
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
        onKey: _handleKeyEscape,
        child: Scaffold(
          appBar: AppBar(
            elevation: 1,
            backgroundColor: const Color.fromARGB(255, 0, 68, 120),
          ),
          backgroundColor: Colors.white,
          body: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
             children: [
               // 1) Linha com 1 botão (verde)
               Expanded(
                 flex: 1,
                 child: Row(
                   children: [
                     Expanded(
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.green,
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.zero,
                           ),
                         ),
                         child: const Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.person,
                               color: Colors.white,
                               size: 40,
                             ),
                             SizedBox(height: 8),

                             Text(
                               'CLIENTES',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
               const SizedBox(height: 5),

               // 2) Linha com 2 botões (verde)
               Expanded(
                 flex: 1,
                 child: Row(
                   children: [
                     Expanded(
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.green,
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.zero,
                           ),
                         ),
                         child: const Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.shopping_cart,
                               color: Colors.white,
                               size: 40,
                             ),
                             SizedBox(height: 8),
                             Text(
                               'PEDIDOS',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     const SizedBox(width: 5),
                     Expanded(
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.green,
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.zero,
                           ),
                         ),
                         child: const Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.work,
                               color: Colors.white,
                               size: 40,
                             ),
                             SizedBox(height: 8),
                             Text(
                               'REPRESENTANTES',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
              const SizedBox(height: 5),
               // 3) Linha com 3 botões (azul)
               Expanded(
                 flex: 1,
                 child: Row(
                   children: [
                     Expanded(
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.blue[900],
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.zero,
                           ),
                         ),
                         child: const Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.search,
                               color: Colors.white,
                               size: 40,
                             ),
                             SizedBox(height: 8),
                             Text(
                               'CONSULTAS',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     const SizedBox(width: 5),
                     Expanded(
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.blue[900],
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.zero,
                           ),
                         ),
                         child: const Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.sync,
                               color: Colors.white,
                               size: 40,
                             ),
                             SizedBox(height: 8),
                             Text(
                               'COMUNICAÇÃO',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     
                     // Exemplo com "badge" vermelho no canto (Mensagens)
                     const SizedBox(width: 5),
                     Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[900],
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                            ),
                          ),
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.chat,
                                color: Colors.white,
                                size: 40,
                              ),
                              SizedBox(height: 8),
                              Text(
                                'MENSAGENS',
                                 style: TextStyle(
                                   color: Colors.white,
                                   fontSize: 12,
                                  ),
                              ),
                            ],
                          ),
                        ),
                           /*
                           Positioned(
                             top: 8,
                             right: 8,
                             child: Container(
                               width: 12,
                               height: 12,
                               decoration: const BoxDecoration(
                                 color: Colors.red,
                                 shape: BoxShape.circle,
                               ),
                             ),
                           ),
                           */
                     ),
                     
                   ],
                 ),
               ),
              const SizedBox(height: 5),
               // 4) Linha com 3 botões (azul)
               Expanded(
                 flex: 1,
                 child: Row(
                   children: [
                     Expanded(
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.blue[900],
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.zero,
                           ),
                         ),
                         child: const Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.inventory,
                               color: Colors.white,
                               size: 40,
                             ),
                             SizedBox(height: 8),
                             Text(
                               'PRODUTOS',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     const SizedBox(width: 5),
                     Expanded(
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.blue[900],
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.zero,
                           ),
                         ),
                         child: const Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.build,
                               color: Colors.white,
                               size: 40,
                             ),
                             SizedBox(height: 8),
                             Text(
                               'FERRAMENTAS',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                     const SizedBox(width: 5),
                     Expanded(
                       child: ElevatedButton(
                         onPressed: () {},
                         style: ElevatedButton.styleFrom(
                           backgroundColor: Colors.blue[900],
                           shape: const RoundedRectangleBorder(
                             borderRadius: BorderRadius.zero,
                           ),
                         ),
                         child: const Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Icon(
                               Icons.info,
                               color: Colors.white,
                               size: 40,
                             ),
                             SizedBox(height: 8),
                             Text(
                               'INFORMAÇÕES',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 12,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
                
               const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Versão 1.0.0'),
                  ],
                ),
             ],
           ),
          ),
        ),
      ),
    );
  }
}
