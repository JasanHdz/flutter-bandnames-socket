import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

enum ServerStatus {
  Online,
  Offline,
  Connecting
}

class SocketService with ChangeNotifier {
  ServerStatus _serverStatus = ServerStatus.Connecting;
  late IO.Socket _socket;
  ServerStatus get serverStatus => this._serverStatus;
  IO.Socket get socket => this._socket;

  SocketService() {
    this._initConfig();
  }

  void _initConfig() {
    // dart client
   this._socket = IO.io('http://localhost:3000', 
      IO.OptionBuilder()
      .setTransports(['websocket']) // for Flutter or Dart VM
      .enableAutoConnect()
      .build()
    );
    this._socket.onConnect((_) {
      this._serverStatus = ServerStatus.Online;
      notifyListeners();
    });
    this._socket.onDisconnect((_) {
      this._serverStatus = ServerStatus.Offline;
      notifyListeners();
    });
  }
}