import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _resultado = 'R\$ 0.00';

  void _obterValor() async {
    var url = 'https://blockchain.info/ticker';
    http.Response response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);

    setState(() {
      _resultado = '${retorno['BRL']['symbol']} ${retorno['BRL']['buy']}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/bitcoin.png',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, bottom: 30),
              child: Text(
                _resultado,
                style: TextStyle(fontSize: 35),
              ),
            ),
            RaisedButton(
              onPressed: _obterValor,
              child: Text(
                'Atualizar',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              color: Color(0xffFF9400),
              padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
            ),
          ],
        ),
      ),
    );
  }
}
