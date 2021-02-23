import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:internetConnection/validations/internet/validationInternet.dart';

class InternetConnectivity extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //Comportamiento por peticiones del usuario
    void _dialogConexion([bool value = false]) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (BuildContext context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          });
      /*Se valida si el dispositivo tiene conectividad a internet,
        muestra un CircularProgressIndicator por 3 segundos,
        si hay conexión cierra el dialog y regresa a la pantalla
        anterior y si no hay conexión solo cierra el dialog
        */
      Future.delayed(const Duration(seconds: 3), () {
        if (value) {
          Navigator.pop(context);
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
        }
      });
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.signal_wifi_off,
              size: 100,
              color: Colors.blueAccent,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Center(
                  child: Text(
                "¡Sin conexión de internet!",
                style: TextStyle(fontSize: 23),
              )),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 5),
              child: Center(child: Text("Verificar conectividad", style: TextStyle(fontSize: 20))),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: InkWell(
                onTap: () {
                  //Todo Validacion de conexion a internet
                  ValidationInternet.conexion(context).then((bool onValue) {
                    if (onValue) {
                      try {
                        _dialogConexion(onValue);
                      } catch (error) {
                        log('InternetConectivity', error: error);
                      }
                    } else {
                      _dialogConexion();
                    }
                  });
                },
                child: Text("REINTENTAR", style: TextStyle(fontSize: 18, color: Colors.blue)),
              ),
            )
          ],
        ),
      ),
    );
  }
}