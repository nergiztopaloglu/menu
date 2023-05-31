import 'package:flutter/material.dart';
import 'package:menu/DetaySayfa.dart';
import 'package:menu/Yemekler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({ Key? key, required this.title}) : super(key: key);



  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Future<List<Yemekler>> yemekleriGetir() async {

    List<Yemekler> yemekListesi=[];

    var y1 = Yemekler(1, "Köfte", "kofte.jpg", 15.99);
    var y2 = Yemekler(2, "Ayran", "ayran.jpg", 2.0);
    var y3 = Yemekler(3, "Fanta", "fanta.jpg", 3.0);
    var y4 = Yemekler(4, "Makarna", "pilav.jpg", 14.99);
    var y5 = Yemekler(5, "Kadayıf", "pilav.jpg", 8.50);
    var y6 = Yemekler(6, "Baklava", "pilav.jpg", 15.99);

    yemekListesi.add(y1);
    yemekListesi.add(y2);
    yemekListesi.add(y3);
    yemekListesi.add(y4);
    yemekListesi.add(y5);
    yemekListesi.add(y6);

    return yemekListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yemekler"),
      ),
      body: FutureBuilder<List<Yemekler>>(
        future: yemekleriGetir(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var yemekListesi = snapshot.data;

            return ListView.builder(
              itemCount: yemekListesi!.length,
              itemBuilder: (context,indeks){
                var yemek = yemekListesi[indeks];

                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetaySayfa(yemek: yemek,)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        SizedBox(width:150,height:150,child: Image.asset("resimler/${yemek.yemek_resim_adi}")),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(yemek.yemek_adi,style: TextStyle(fontSize: 25),),
                            SizedBox(height: 50,),
                            Text("${yemek.yemek_fiyat} \u{20BA}",style: TextStyle(fontSize: 20,color: Colors.blue),),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_right),
                      ],
                    ),
                  ),
                );
              },
            );

          }else{
            return Center();
          }
        },
      ),

    );
  }
}
