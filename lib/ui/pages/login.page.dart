import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String query="";
  bool notVisible=false;
  TextEditingController queryTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const appTitle = 'Form Styling Demo';
    return Scaffold(
        appBar: AppBar(
          title: Text("$appTitle=> $query"),
        ),
        body: ListView(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                    child: TextFormField(
                      autofocus: true,
                      obscureText: notVisible,
                      onChanged: (value){
                        setState(() {
                          this.query = value;
                        });
                      },
                      controller: queryTextEditingController,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left: 20),
                        suffixIcon: IconButton(
                          icon: Icon(
                              notVisible==true?Icons.visibility_off:Icons.visibility),
                          onPressed: () {
                            setState(() {
                              notVisible = !notVisible;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        hintText: 'Enter a search term',
                      ),

                    ),
                  ),
                ),
                IconButton(
                  onPressed: (){
                    setState(() {
                      this.query = queryTextEditingController.text;
                      print(this.query);
                    });
                  },
                  icon: Icon(Icons.search,color: Colors.deepOrange,),

                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter your username ',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your password',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: TextField(
                //obscureText: true,
                onChanged: (text) {
                  print('First text field: $text');
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your changess',
                ),
              ),
            ),
          ],
        ),
    );
  }
}

