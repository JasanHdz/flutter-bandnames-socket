import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:band_names/services/socket_service.dart';

class StatusPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final socketService = Provider.of<SocketService>(context);
    final socket = socketService.socket;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ServerStatus: ${socketService.serverStatus}')
          ],
        )
     ),
     floatingActionButton: FloatingActionButton(
       child: Icon(Icons.message),
       onPressed: () {
         socket.emit('message', {
           'name': 'Jasan Hernández',
           'age': 24,
         });
       },
     ),
   );
  }
}