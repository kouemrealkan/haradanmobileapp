import 'dart:io';

import 'package:flutter/material.dart';
import 'package:haradan/components/product_card.dart';
import 'package:haradan/models/Product.dart';
import 'package:haradan/services/api_manager.dart';
import 'package:haradan/services/models/son_ilanlar.dart';

import '../../../size_config.dart';
import 'section_title.dart';

class PopularProducts extends StatefulWidget {
  @override
  _PopularProductsState createState() => _PopularProductsState();
}

class _PopularProductsState extends State<PopularProducts> {
  Future<SonIlanlar> _sonIlanlar;
  HttpException exception ;

  @override
  void initState() {
    // TODO: implement initState
    _sonIlanlar = API_Manager().getSonIlanlar();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Vitrin İlanları", press: () {}),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        FutureBuilder<SonIlanlar>(
          future: _sonIlanlar,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ...List.generate(
                      snapshot.data.data.length,
                          (index) {



                          return ProductCard(advert: snapshot.data.data[index]);


                      },
                    ),
                    SizedBox(width: getProportionateScreenWidth(20)),
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        )
      ],
    );
  }
}


/*


return ListView.builder(
                 itemCount: snapshot.data.data.length,
                 itemBuilder: (context,index) {
                   var values =snapshot.data.data[index];
               return Container(
                 height: 100.0,
                 child: Row(
                   children:<Widget>[
                     Text(values.title),
                   ],
                 ),
               );
             });
 */