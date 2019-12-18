import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Tetraedro extends StatefulWidget{
  @override
    createState()=>_TetraedroState();
}

class _TetraedroState extends State<Tetraedro>{

  List<int> _v1=[0,0,0];
  List<int> _v2=[0,0,0];
  List<int> _v3=[0,0,0];
  double _volumen=0.0;
  List<String> _vec=["X","Y","z"];

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Ejercicio 2"),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          children: <Widget>[
            _crearVector(_v1,0),
            Divider(),
            _crearVector(_v2,1),
            Divider(),
            _crearVector(_v3,2),
            Divider(),
            _mostrarMatriz(),
            Divider(),
            _conseguirVolumen(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.keyboard_arrow_left),
          onPressed: (){
            _mostrarVolumen(context);
          },
        ),
      );
    }

  Widget _crear(List<int> _x, int i,int j){
    return 
        TextField(
          keyboardType: TextInputType.number, //forma de teclado      
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20.0)
            ),
            hintText: "${_vec[j]} ${i+1}", //texto sugerencia
            labelText: "${_vec[j]} ${i+1}", //
          ),
          onChanged: (valor) =>setState(() {
            _x[i]=int.parse(valor);
          })
        );
  }

  Widget _crearVector(List<int> _x,int i){
    return  Row(
        children:[
          Expanded(
            child: _crear(_x,0,i),
          ),
          Expanded(
            child: _crear(_x,1,i),
          ), 
          Expanded(
            child: _crear(_x,2,i),
          ),
        ],
    );
  }

  Widget _mostrarMatriz(){
    return Card(
      elevation: 10.0,
    //borde
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.ltr,
        children: <Widget>[
          Text(
            "${_v1[0]},${_v2[0]},${_v3[0]}",
            style: TextStyle(
              color: Colors.black,
              fontSize:  25.0,
            ),
          ),
          Text(
            "${_v1[1]},${_v2[1]},${_v3[1]}",
            style: TextStyle(
              color: Colors.black,
              fontSize:  25.0,
            ),
          ),
          Text(
            "${_v1[2]},${_v2[2]},${_v3[2]}",
            style: TextStyle(
              color: Colors.black,
              fontSize:  25.0,
            ),
          ),

        ],
      ),
    );
  }
  
  Widget _conseguirVolumen(){
    //arriba hacia derecha
    int _x1,_x2,_x3;
    _x1=_v1[0]*_v2[1]*_v3[2];
    _x2=_v1[2]*_v2[0]*_v3[1];
    _x3=_v1[1]*_v2[2]*_v3[0];
    //abajo hacia izquierda
    int _y1,_y2,_y3;
    _y1=_v1[2]*_v2[1]*_v3[0];
    _y2=_v1[1]*_v2[0]*_v3[2];
    _y3=_v1[0]*_v2[2]*_v3[1];
    
    _volumen=(_x1+_x2+_x3-_y1-_y2-_y3)*.6;

    return ListTile(
      title: Text(""),
    );
  }

  void _mostrarVolumen(BuildContext context){
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context){
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          title: Text(
            "Volumen",
            style: TextStyle(
              color: Colors.black,
              fontSize:  25.0,
            ),
          ),
          content: Column(
            //tamaño
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "$_volumen",
              style: TextStyle(
              color: Colors.black,
              fontSize:  45.0,
            ),  
              ),
            ],
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                "Ok",
                style: TextStyle(
                  fontSize:  25.0,
                ),
                ),
              onPressed: ()=> Navigator.of(context).pop(),
            )
          ],
        );
      }
    );
  }

}