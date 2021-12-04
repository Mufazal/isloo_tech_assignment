import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:isloo_tech_assignment/api/api_resource.dart';
import 'package:isloo_tech_assignment/api/api_status.dart';
import 'package:isloo_tech_assignment/controller.dart/product_detail_controller.dart';
import 'package:isloo_tech_assignment/controller.dart/product_list_controller.dart';
import 'package:isloo_tech_assignment/objects/product.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatelessWidget {
  final int id;
  final Product productModel;

  MovieDetailScreen({this.id, this.productModel});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var controller =
        Provider.of<ProductDetailController>(context, listen: false);

    controller.getMovies(productModel.id);
    return Material(
      child: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Consumer<ProductListController>(
              builder: (context, snapshot, child) {
            if (snapshot.model == null) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.isConnected == false) {
              return Container(
                child: Center(
                  child: Text("Internet connection error..."),
                ),
              );
            } else if (snapshot.model != null) {
              PsResource resource = snapshot.model;
              Product model = Product.fromJson(resource.data);
              if (resource.status == PsStatus.SUCCESS) {
                // List<Product> model = Product.getProductList(resource.list);
                return Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: height * 0.6,
                        width: width,
                        // color: Colors.red,

                        child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            width: width,
                            imageUrl: "${model.image}",
                            placeholder: (context, url) =>
                                Center(child: CircularProgressIndicator()),
                            errorWidget: (context, url, error) {
                              return Container();
                            })),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.03,
                        left: width * 0.03,
                        right: width * 0.03,
                      ),
                      child: Container(
                        child: Text(
                          "${model.title}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              } else if (resource.status == PsStatus.ERROR) {
                return Container(
                  child: Center(
                    child: Text("Connection Error"),
                  ),
                );
              } else {
                return Container();
              }
            } else {
              return Container();
            }
          }),
        ),
      ),
    );
  }
}

/*
Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    height: height * 0.6,
                    width: width,
                    // color: Colors.red,

                    child: CachedNetworkImage(
                        fit: BoxFit.fill,
                        width: width,
                        imageUrl: "${model.image}",
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) {
                          return Container();
                        })),
                Padding(
                  padding: EdgeInsets.only(
                    top: height * 0.03,
                    left: width * 0.03,
                    right: width * 0.03,
                  ),
                  child: Container(
                    child: Text(
                      "${model.title}",
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ],
            )
*/