import 'package:flutter/material.dart';
import 'package:flutter_project1/NewWidget.dart';

void main(){
  runApp(MaterialApp(home: RefraHome(),));
}

class RefraHome extends StatelessWidget {


  var name=["Phone1","Phone2","Phone3","Phone4","Phone5","Phone6","Phone7","Phone8","Phone9"];
  var image=["https://m.media-amazon.com/images/I/61FZBDYwx4L._AC_SL1500_.jpg",
    "https://images.ctfassets.net/wcfotm6rrl7u/3jcytng7ls5Vsu7Esn00zW/9a907854c6af35752ef7c82a5098b2bf/nokia_6_2-phones-lander-mobile.jpg",
    "https://www.myg.in/images/thumbnails/624/460/detailed/32/APPLE_iPhone_14_Pro_Deep_Purple-1_nnfa-2x.jpg",
    "https://images.hindustantimes.com/tech/img/2023/02/14/960x540/SG2_1676367813910_1676367826859_1676367826859.jpg",
    "https://m.media-amazon.com/images/I/71Ftzmh3XWL._SX679_.jpg",
    "https://m.media-amazon.com/images/I/61IhQqu+M2L.jpg",
    "https://images.samsung.com/is/image/samsung/p6pim/uk/feature/164370272/uk-feature-galaxy-s-535141640?",
    "https://image.cnbcfm.com/api/v1/image/106109497-1567532369328nokiaflipbestpic.jpg?v=1597131240",
    "https://cdn.mos.cms.futurecdn.net/VR3U5aCckdsFbFUQPUWtii.jpg"];

  var price=["\$4000","\$4000","\$4000","\$4000","\$4000","\$3000","\$3000","\$3000","\$3000"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("gridview using refractoring"),
      ),
      body: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),itemCount: 9,
          itemBuilder: (context,index){
        return NewWidget(
            myimage: NetworkImage(image[index]),
            name: name[index],
            price: "${price[index]}"
        );
          }),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Image.asset("assets/images/yellowbackgroundapp.jpg"),
          // Text("My Drawing"),
          // Text("\$100"),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
          ElevatedButton.icon(onPressed: (){},icon: Icon(Icons.favorite), label: Text("Wishlist")),

            SizedBox(
              width: 10,
            ),
            ElevatedButton.icon(onPressed: (){},
                icon: Icon(Icons.shopping_cart),
            label: Text("Buy now")),
        ],
      )
    ],
      )
    );
  }
}
