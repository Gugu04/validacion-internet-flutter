import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

//Verifica si existe conectividad 
class ValidationInternet {

  /*Realiza un ping a google para ver si hay repuesta
    de lo contrario entra a un SocketException que seria 
    un error de conectividad */
  // ignore: missing_return
  static Future<bool> conexion(BuildContext context) async {
    try {
      final List<InternetAddress> result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty)
        return true;
      
    } on SocketException catch (_) {
      return false;
    }
  }
}