// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'model/product.dart';
import 'model/data.dart';
import 'colors.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  // TODO: Add a variable for Category (104)
  final Category category;

  const HomePage({this.category: Category.all});

  @override
  Widget build(BuildContext context) {
    // TODO: Pass Category variable to AsymmetricView (104)
    /*

    return Scaffold(

       AppBar Material Standart

      appBar: AppBar(
        brightness: Brightness.light,
        title: Text("SHRINE"),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: "menu"
          ),
          onPressed: () {
            print("menu");
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
                Icons.search,
              semanticLabel: "search",
            ),
            onPressed: () {
              print("search");
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: "filter",
            ),
            onPressed: () {
              print("filter");
            },
          ),
        ],
      ),

      */

      return AsymmetricView(products: getProducts(category));

      /* Grid View Example

      body: GridView.count(

        crossAxisCount: 2,
        padding: EdgeInsets.all(8.0),
        childAspectRatio: 8.0 / 9.0,
        children: _buildGridCards(context),
      )

    );  */
  }

  List<Card> _buildGridCards(BuildContext context) {

    List<Product> products = getProducts(Category.all);
    if (products == null || products.isEmpty) {
      return const <Card>[];
    }
    final ThemeData theme = Theme.of(context);
    final NumberFormat format = NumberFormat.simpleCurrency(
      locale: Localizations.localeOf(context).toString());

    return products.map((product) {
      return Card(
        // TODO: Adjust card heights (103)
        elevation: 0.0,
        child: Column(
          // TODO: Center items on the card (103)
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18 / 11,
              child: Image.asset(
                product.assetName,
                fit: BoxFit.fitWidth,
                package: product.assetPackage,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  // TODO: Align labels to the bottom and center (103)
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    // TODO: Handle overflowing labels (103)
                    Text(
                      product == null ? '' : product.name,
                      style: theme.textTheme.button,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      product == null ? '' : format.format(product.price),
                      style: theme.textTheme.caption,
                    ),
                    // End new code
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }
}


