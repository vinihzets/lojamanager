import 'package:flutter/material.dart';

class buildColumnWidgets extends StatelessWidget {
  const buildColumnWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
              width: 260,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              )),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: SizedBox(
              width: 260,
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              )),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: SizedBox(
              width: 200,
              child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.grey)),
                onPressed: () {},
                child: Text('Faca Login'),
              )),
        ),
        TextButton(
            onPressed: () {},
            child: const Text(
              'Registre sua loja',
              style: TextStyle(color: Colors.grey),
            ))
      ],
    );
  }
}
