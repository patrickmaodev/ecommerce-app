import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce_app/features/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DefaultHomeScreen extends StatelessWidget {
  DefaultHomeScreen({super.key});

  final HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    final List<String> bannerImages = [
      'https://img.freepik.com/premium-photo/e-commerce-concept-summer-shopping-online-delivery-service-mobile-application-transportation-food-delivery-by-scooter-3d-rendering_350912-88.jpg?uid=R182220677&ga=GA1.1.1213280504.1732201561&semt=ais_hybrid',
      'https://img.freepik.com/premium-psd/online-shopping-with-laptop-mockup-template-shopping-elements_1150-38896.jpg?uid=R182220677&ga=GA1.1.1213280504.1732201561&semt=ais_hybrid',
      'https://images-eu.ssl-images-amazon.com/images/I/61LJk07g5rL._AC_UL900_SR900,600_.jpg'
    ];

    return Scaffold(
      body: Obx(() {
        if (homeController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 200.0,
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                    ),
                    items: bannerImages.map((image) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),

                  Positioned(
                    top: 40,
                    left: 20,
                    right: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search ...',
                          hintStyle: TextStyle(color: Colors.grey.shade600),
                          border: InputBorder.none,
                          prefixIcon:
                              Icon(Icons.search, color: Colors.grey.shade600),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Categories Section
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Categories",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              Obx(() {
                if (homeController.categoryController.categories.isEmpty) {
                  return const Center(child: Text("No categories available"));
                }

                return SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.categoryController.categories.length,
                    itemBuilder: (context, index) {
                      final category = homeController.categoryController.categories[index];
                      return Container(
                        margin: const EdgeInsets.only(left: 16),
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.grey.shade200,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              category.name,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),

              const SizedBox(height: 20),

              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Trending Products",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),

              Obx(() {
                if (homeController.productController.products.isEmpty) {
                  return const Center(child: Text("No products available"));
                }

                return SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: homeController.productController.products.length,
                    itemBuilder: (context, index) {
                      final product = homeController.productController.products[index];
                      return Container(
                        margin: const EdgeInsets.only(left: 16),
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 120,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8.0),
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                  top: Radius.circular(8.0),
                                ),
                                child: Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Center(child: Icon(Icons.error)),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                product.name,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text("\$${product.price.toStringAsFixed(2)}"),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              }),

              const SizedBox(height: 20),
            ],
          ),
        );
      }),
    );
  }
}
