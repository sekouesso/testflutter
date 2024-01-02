import 'package:flutter/material.dart';

class MeteoPage extends StatelessWidget {
  const MeteoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Météo'),),
      body: Center(
        child: Text('Météo Page',style: Theme.of(context).textTheme.bodyText2,),
      ),
    );
  }
}
