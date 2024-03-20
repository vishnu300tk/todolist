import 'package:flutter/material.dart';

import 'package:hive_to_do_list/pages/home_page.dart';

class Welcomepage extends StatefulWidget {
  const Welcomepage({super.key});

  @override
  State<Welcomepage> createState() => _AlertPageState();
}

class _AlertPageState extends State<Welcomepage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue,
        body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("welcome",style: TextStyle(fontWeight: FontWeight.bold),),
            ElevatedButton(onPressed:(){Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
            } ,
             child:const Icon(Icons.arrow_forward_ios),
             )
          ],
        ),
        ),
      ),
    );
  }
}