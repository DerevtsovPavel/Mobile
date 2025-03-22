import 'package:flutter/material.dart';
import 'package:lab_3/SecondScreen.dart';

class MyForm extends StatefulWidget{
  @override
  State<MyForm> createState() => MyFormState();
}

class MyFormState extends State<MyForm>{
    double a=0,b=0;
    bool agreement = false;
    final form_key = GlobalKey<FormState>();
    final field_a = TextEditingController();
    final field_b = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      child: Form(
            key: form_key,
            child: Column(children:
                  [
                    TextFormField(
                    controller: field_a,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "a"),
                    validator: (value) {
                      if (value!.isEmpty) return "Введите число";
                      final double? num = double.tryParse(value);
                      if(num==null){
                        return "Введите число";
                      }
                    },
                    ),

                  TextFormField(
                    controller: field_b,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "b"),
                    validator: (value) {
                      if (value!.isEmpty) return "Введите число";
                      final double? num = double.tryParse(value);
                      if(num==null){
                        return "Введите число";
                      }
                    },
                    ),

                  CheckboxListTile(value: agreement,
                      title: Text("Я согласен"),
                       onChanged: (value) => setState(()=>agreement = value!),
                   
                   ),

                  ElevatedButton(onPressed: (){
                    if(form_key.currentState!.validate() && agreement){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SecondScreen(
                          a: double.parse(field_a.text),
                          b: double.parse(field_b.text),
                          )
                          )
                          );
                    }
                  }, 
                  child: Text("Рассчитать"),
              ),
              ],
          )
      )
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: MyForm()
      );
  }
}
