import 'package:flutter/material.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login'),),
      body:SingleChildScrollView(
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage("images/person.jpg") ,
                radius: 40,
              ),
            ),
            const SizedBox(height: 50.0,),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.cyan,
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Votre mot de Passe",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Colors.cyan,
                  ),
                  border: OutlineInputBorder(),
                  hintText: "Votre @ mail",
                ),
              ),
            ),
            Row(
              children: [
                const Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text("Haven't you an Account?"),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                        Navigator.pushNamed(context, "/");
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blue,//change background color of button
                        onPrimary: Colors.white,//change text color of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 0.0,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Register',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.pinkAccent,//change background color of button
                        onPrimary: Colors.white,//change text color of button
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        elevation: 15.0,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      )
    );
  }
}
