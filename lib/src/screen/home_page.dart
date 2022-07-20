import 'package:erbil_shopping/src/screen/product_detail.dart';
import 'package:erbil_shopping/src/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class HomeScreen extends StatelessWidget {
  List<String> products = [
    "https://m.media-amazon.com/images/I/81nC4u9eYfL._UY445_.jpg",
    "https://www.uniqlo.com/jp/ja/contents/feature/masterpiece/common_22ss/img/products/contentsArea_itemimg_16.jpg",
    "https://www.alphaindustries.eu/media/image/06/47/51/158205-142-alpha-industries-agent-pant-001.jpg",
    "https://www.rei.com/media/product/1541670027",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(
            Icons.notifications,
            color: primaryColor,
          )
        ],
        title: Text("Explore", style: TextStyle(color: primaryColor)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: primaryColor),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  icon: Icon(
                    Icons.search,
                  ),
                  label: Text("Search")),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                  child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (ctx, index) => GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail(
                                          productImage: products[index],
                                          colors: [
                                            Colors.red,
                                            Colors.green,
                                            Colors.blue
                                          ],
                                        ))),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15)),
                              height: 100,
                              width: 100,
                              child: Image.network(
                                products[index],
                                fit: BoxFit.fill,
                              ),
                            ),
                          ))),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "My Profile")
        ],
      ),
    );
  }
}
