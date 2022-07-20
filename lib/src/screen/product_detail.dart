import 'package:erbil_shopping/src/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail(
      {Key? key, required this.productImage, required this.colors})
      : super(key: key);
  final String productImage;
  final List<Color> colors;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
                child: Stack(children: [
              Align(
                alignment: Alignment.center,
                child: Image.network(
                  productImage,
                  fit: BoxFit.fill,
                ),
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back))),
              Align(
                  alignment: Alignment.topRight,
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.favorite_outline)))
            ])),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "T-shirt",
                          style: TextStyle(color: primaryColor, fontSize: 24),
                        ),
                        Spacer(),
                        Text(
                          "15.99\$",
                          style: TextStyle(color: primaryColor, fontSize: 24),
                        )
                      ],
                    ),
                    Text(
                      "dklsjfoiwvnqoiehrg[oiqe[oivneqo[iheuoifhqpiufvherpiuhiuhpiuhipuhiuhipuhpuh",
                      style: TextStyle(color: primaryColor, fontSize: 20),
                    ),
                    ListTile(
                        title: Text(
                          "Colors:",
                          style: TextStyle(color: primaryColor, fontSize: 24),
                        ),
                        subtitle: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            height: 25,
                            width: double.infinity,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (ctx, index) => CircleAvatar(
                                backgroundColor: colors[index],
                              ),
                              separatorBuilder: (ctx, index) =>
                                  SizedBox(width: 10),
                              itemCount: 3,
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
