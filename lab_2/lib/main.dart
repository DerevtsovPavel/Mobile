import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Лабораторная работа 2'),
        ),
        body: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child:Center( //для скролла, может иметь только один влож. элемент
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          // Здесь будут ваши виджеты
          Wrap(
            spacing: 1, //отступ по основной оси, здесь по горизонтали
            runSpacing: 40, //отступ между контейнерами по поперечной оси, здесь по вертикали
            children: [
              
              Container(
                padding: EdgeInsets.all(8),
                color: Colors.amber,
                child: Image.network("https://avatars.mds.yandex.net/i?id=7b6c0df1d7b028f16384476a1fd11aa2_l-4238926-images-thumbs&n=13"),),
              Container(padding: EdgeInsets.all(8),
                color: Colors.amber,
                child: Image.network("https://avatars.mds.yandex.net/get-mpic/5252557/img_id844761290857337258.jpeg/orig")),
              Container(padding: EdgeInsets.all(8),
                color: Colors.amber,
                child: Image.network("https://avatars.mds.yandex.net/i?id=2a22d58d3db4aae1f1a69ff1631ec543_l-5208943-images-thumbs&n=13")),
             Container(padding: EdgeInsets.all(8),
                color: Colors.amber,
                child: Image.network("https://avatars.mds.yandex.net/i?id=225a105ece189ac1e1129dc929a38197_l-4864596-images-thumbs&n=13")),
              Container(padding: EdgeInsets.all(8),
                color: Colors.amber,
                child: Image.network("https://avatars.mds.yandex.net/i?id=dcb8c3b76304b839edd1ce8acf26d4f4_l-5233211-images-thumbs&n=13")),
              ],
          )
        ],
      ),
    ),
    );
  }
  }