import 'package:flutter/material.dart';
import 'package:internetConnection/presentation/blueScreen.dart';
import 'package:internetConnection/validations/internet/internetConnectivity.dart';
import 'package:internetConnection/validations/internet/validationInternet.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hola'),
      ),
      body: Center(
        child: Container(
            child: RaisedButton(
              padding: EdgeInsets.symmetric(vertical:7,horizontal:7),
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('Consulta',style: TextStyle(fontSize:25,)),
                onPressed: () {
                  //Se valida si el dispositivo tiene conectividad al internet
                  ValidationInternet.conexion(context).then((onValueConexion) {
                    /*Si hay conexión al internet podrá realizar peticiones 
                      a la base de datos o lo que requiera el aplicativo*/
                    if (onValueConexion) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BlueScreen()));
                      /*Si no existe conectividad al internet se mostrára una pantalla
                      advirtiendo que no tienen conexion al internet*/
                    } else {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => InternetConnectivity()));
                    }
                  });
                })),
      ),
    );
  }
}
