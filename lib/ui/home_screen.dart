import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:isloo_tech_assignment/api/api_resource.dart';
import 'package:isloo_tech_assignment/api/api_status.dart';
import 'package:isloo_tech_assignment/constant/colors.dart';
import 'package:isloo_tech_assignment/controller.dart/product_list_controller.dart';
import 'package:isloo_tech_assignment/objects/product.dart';
import 'package:isloo_tech_assignment/ui/poduct_detail_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Get.put(ProductListController());
    // controller.getMovies();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Listings",
          style: TextStyle(color: Colors.white),
        ),
        // titleSpacing: 0,
        centerTitle: true,
        backgroundColor: AppColor.DARK_YELLOW,
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: Container(
        height: height,
        width: width,
        child: Column(
          children: [
            Container(
              color: AppColor.DARK_YELLOW,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(
                          AppColor.DARK_YELLOW.withOpacity(0.1)),
                      backgroundColor: MaterialStateProperty.all(
                          AppColor.DARK_YELLOW.withOpacity(0.5)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //side: BorderSide(color: Colors.red)
                      )),
                    ),
                    child: Text(
                      "All",
                      style: TextStyle(
                        color: Colors.white,
                        //  fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      // backgroundColor:MaterialStateProperty.all(value)<Color>(),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),

                        //side: BorderSide(color: Colors.red)
                      )),
                    ),
                    child: Text(
                      "Cranes",
                      style: TextStyle(
                        color: Colors.black,
                        // fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.white),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        //side: BorderSide(color: Colors.red)
                      )),
                    ),
                    child: Text(
                      "Trailers",
                      style: TextStyle(
                        color: Colors.black,
                        //   fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            GetBuilder<ProductListController>(initState: (state) {
              ProductListController.to.getMovies();
            }, builder: (snapshot) {
              if (snapshot.model.status == PsStatus.BLOCK_LOADING) {
                return Expanded(
                    child: Container(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ));
              } else if (snapshot.model.status == PsStatus.ERROR) {
                return Expanded(
                  child: Container(
                    child: Center(
                      child: Text("Internet connection error..."),
                    ),
                  ),
                );
              } else if (snapshot.model.status == PsStatus.SUCCESS) {
                PsResource resource = snapshot.model;

                List<Product> model = Product.getProductList(resource.list);
                return Expanded(
                  child: Container(
                    // height: height * 0.4,
                    child: ListView.builder(
                      itemCount: model.length,
                      itemBuilder: (context, index) =>
                          listItem(height, width, model[index], context, index),
                    ),
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
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.013,
                left: width * 0.04,
              ),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Top Machinery",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.01,
                left: width * 0.04,
              ),
              child: Container(
                width: width,
                height: height * 0.2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.1,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                            color: AppColor.EMPTY_CARD_COLOR,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.01,
                left: width * 0.04,
              ),
              child: Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Lorem Ipsum dolor",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: height * 0.01,
                left: width * 0.04,
              ),
              child: Container(
                width: width,
                height: height * 0.1,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 7,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: height * 0.02,
                        width: width * 0.25,
                        decoration: BoxDecoration(
                            color: AppColor.EMPTY_CARD_COLOR,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  listItem(height, width, Product model, context, index) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProductDetailScreen(
                id: model.id,
              ),
            ));
      },
      child: Padding(
        padding: EdgeInsets.only(
            top: index == 0 ? height * 0.01 : 0,
            left: width * 0.04,
            right: width * 0.04),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
            height: height * 0.12,
            width: width,

            //  color: Colors.blue,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //================================ Image Container Use Here ========================\\\
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: width * 0.2,
                    height: height * 0.1,
                    child: Center(
                      child: CachedNetworkImage(
                          //  width: width * 0.07,
                          imageUrl: "${model.image}",
                          placeholder: (context, url) =>
                              Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) {
                            return Container();
                          }),
                    ),
                  ),
                ),
                Expanded(
                  //  flex: 2,
                  child: Container(
                    // color: Colors.red,
                    height: height * 0.1,
                    child: Padding(
                      padding: EdgeInsets.only(left: width * 0.02),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            child: Text(
                              "${model.title}",
                              maxLines: 1,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.004),
                            child: Container(
                              child: Text(
                                "${model.category}",
                                maxLines: 1,
                                style: TextStyle(color: AppColor.DARK_YELLOW),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: height * 0.005),
                            child: Container(
                              height: 25,
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      AppColor.DARK_YELLOW),
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    //side: BorderSide(color: Colors.red)
                                  )),
                                ),
                                child: Text(
                                  "Add to job",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Colors.grey,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
