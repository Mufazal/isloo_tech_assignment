import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:isloo_tech_assignment/api/api_resource.dart';
import 'package:isloo_tech_assignment/api/api_status.dart';
import 'package:isloo_tech_assignment/constant/colors.dart';
import 'package:isloo_tech_assignment/controller.dart/product_detail_controller.dart';
import 'package:isloo_tech_assignment/controller.dart/product_list_controller.dart';
import 'package:isloo_tech_assignment/objects/product.dart';
import 'package:get/get.dart';
import 'package:isloo_tech_assignment/ui/location_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final int id;

  ProductDetailScreen({
    this.id,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Get.put(ProductDetailController());
    print(" Product ID ---------${id}");
    //   controller.getMovies(id);
    return Material(
      child: SafeArea(
        child: Container(
          height: height,
          width: width,
          color: Colors.white,
          child: GetBuilder<ProductDetailController>(initState: (state) {
            ProductDetailController.to.getSingleProductDetail(id);
          }, builder: (snapshot) {
            if (snapshot.model.status == PsStatus.BLOCK_LOADING) {
              return Container(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (snapshot.model.status == PsStatus.ERROR) {
              return Container(
                child: Center(
                  child: Text("Internet connection error..."),
                ),
              );
            } else if (snapshot.model.status == PsStatus.SUCCESS) {
              PsResource resource = snapshot.model;
              Product model = Product.fromJson(resource.data);
              //  if (resource.status == PsStatus.SUCCESS) {
              // List<Product> model = Product.getProductList(resource.list);
              return Padding(
                padding: EdgeInsets.only(
                    top: height * 0.11,
                    left: width * 0.03,
                    right: width * 0.03),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                        height: height * 0.55,
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
                        top: height * 0.04,
                        left: width * 0.03,
                        right: width * 0.03,
                      ),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${model.category}",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 19, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.01,
                        left: width * 0.03,
                        right: width * 0.03,
                      ),
                      child: Container(
                        width: width,
                        child: Text(
                          "${model.title}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            color: AppColor.DARK_YELLOW,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: height * 0.01,
                        left: width * 0.03,
                        right: width * 0.03,
                      ),
                      child: Container(
                        child: Text(
                          "${model.description}",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.left,
                          style: TextStyle(

                              //  fontSize: 19,
                              ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: height * 0.05),
                      child: Container(
                        width: width * 0.4,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LocationScreen(),
                            ));
                          },
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(AppColor.DARK_YELLOW),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              side: BorderSide(color: AppColor.DARK_YELLOW),
                            )),
                          ),
                          child: Text(
                            "Add to Cart",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else if (snapshot.model.status == PsStatus.ERROR) {
              return Container(
                child: Center(
                  child: Text("Connection Error"),
                ),
              );
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