import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Firstscreen(),
        '/Encrypt1': (context) => Encrypt1(),
        '/Decrypt1': (context) => Decrypt1(),
        '/Encrypt2': (context) => Encode(),
        '/Decrypt2': (context) => Decode(),
      },
    );
  }
}

class Firstscreen extends StatelessWidget {
  const Firstscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('EncDec'),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Encrypt1');
                },
                child: Text('Encrypt'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
              SizedBox(width: double.infinity, height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Decrypt1');
                },
                child: Text('Decrypt'),
                style: ElevatedButton.styleFrom(
                    primary: Colors.blue[900],
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    textStyle:
                        TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Encrypt1 extends StatefulWidget {
  const Encrypt1({Key? key}) : super(key: key);

  @override
  _Encrypt1State createState() => _Encrypt1State();
}

class _Encrypt1State extends State<Encrypt1> {
  String imagepath = "";
  String buttonName = "Select Image";
  final picker = ImagePicker();
  bool button = true;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Encryption'),
      ),
      body: Center(
        child: Column(
          children: [
            imagepath != ""
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 400.0,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Image.file(File(imagepath)),
                    ),
                  )
                : Container(),
            ElevatedButton(
              onPressed: () async {
                if (button == true) {
                  final pickedFile =
                      await picker.getImage(source: ImageSource.gallery);
                  if (pickedFile != null && button == true) {
                    setState(() {
                      imagepath = pickedFile.path;
                      buttonName = "Next";
                      button = false;
                    });
                  }
                } else {
                  setState(() {
                    Navigator.pushNamed(context, '/Encrypt2');
                  });
                }
              },
              child: Text(buttonName),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Decrypt1 extends StatefulWidget {
  const Decrypt1({Key? key}) : super(key: key);

  @override
  _Decrypt1State createState() => _Decrypt1State();
}

class _Decrypt1State extends State<Decrypt1> {
  String imagepath = "";
  String buttonName = "Select Image";
  final picker = ImagePicker();
  bool button = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('Decryption'),
      ),
      body: Center(
        child: Column(
          children: [
            imagepath != ""
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      height: 400.0,
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Image.file(File(imagepath)),
                    ),
                  )
                : Container(),
            ElevatedButton(
              onPressed: () async {
                if (button == true) {
                  final pickedFile =
                      await picker.getImage(source: ImageSource.gallery);
                  if (pickedFile != null && button == true) {
                    setState(() {
                      imagepath = pickedFile.path;
                      buttonName = "Next";
                      button = false;
                    });
                  }
                } else {
                  setState(() {
                    Navigator.pushNamed(context, '/Decrypt2');
                  });
                }
              },
              child: Text(buttonName),
              style: ElevatedButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Encode extends StatefulWidget {
  const Encode({Key? key}) : super(key: key);

  @override
  _EncodeState createState() => _EncodeState();
}

class _EncodeState extends State<Encode> {
  bool _securetext = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Encode',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Center(
            child: Text(
                'Please enter your message here.'
                'Note that longer the message, bigger is the space required',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Your Message',
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                  style: BorderStyle.solid,
                  color: Colors.blueAccent,
                )),
              ),
              maxLines: 5,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Center(
            child:
                Text('Please enter a strong password of atleast 6 characters.',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                fillColor: Colors.black12,
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(_securetext ? Icons.remove_red_eye : Icons.lock),
                  onPressed: () {
                    setState(() {
                      _securetext = !_securetext;
                    });
                  },
                ),
              ),
              obscureText: _securetext,
              maxLength: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Encode',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 140.00, vertical: 3.00),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      )),
    );
  }
}

class Decode extends StatefulWidget {
  const Decode({Key? key}) : super(key: key);

  @override
  _DecodeState createState() => _DecodeState();
}

class _DecodeState extends State<Decode> {
  bool _securetext = true;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text(
          'Decode',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
          child: Column(
        children: [
          Center(
            child: Text(
                'Your image is successfully decoded. However to access the message, you must type the password!',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: Text('Please enter the password used to encode this image.',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                hintText: 'Password',
                border: OutlineInputBorder(),
                fillColor: Colors.black12,
                filled: true,
                suffixIcon: IconButton(
                  icon: Icon(_securetext ? Icons.remove_red_eye : Icons.lock),
                  onPressed: () {
                    setState(() {
                      _securetext = !_securetext;
                    });
                  },
                ),
              ),
              obscureText: _securetext,
              maxLength: 10,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                'Decode',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  padding:
                      EdgeInsets.symmetric(horizontal: 140.00, vertical: 3.00),
                  textStyle:
                      TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      )),
    );
  }
}
