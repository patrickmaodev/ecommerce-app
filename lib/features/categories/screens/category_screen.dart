import 'package:ecommerce_app/api/api_client.dart';
import 'package:ecommerce_app/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/features/categories/controllers/category_controller.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final CategoryController _categoryController = Get.put(CategoryController(ApiClient()));

  String _selectedCategory = '';
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _categoryController.fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppTheme.primary,
        elevation: 0,
        toolbarHeight: 70,
        title: Container(
          decoration: BoxDecoration(
            color: AppTheme.grey200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search categories...',
              hintStyle: TextStyle(color: AppTheme.grey600),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: AppTheme.grey600),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            ),
            onChanged: (query) {
              setState(() {
                _searchQuery = query.toLowerCase();
              });
            },
          ),
        ),
      ),
      body: Obx(() {
        // Check if categories are loading
        if (_categoryController.isLoading.value && _selectedCategory.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        if (_selectedCategory.isEmpty && _categoryController.categories.isNotEmpty) {
          _selectedCategory = _categoryController.categories.first.name;
          _categoryController.fetchCategoryProducts(_categoryController.categories.first.id);
        }

        return Row(
          children: [
            // Category List
            Container(
              width: MediaQuery.of(context).size.width * 0.3,
              color: AppTheme.grey200,
              child: ListView.builder(
                itemCount: _categoryController.categories.length,
                itemBuilder: (context, index) {
                  final category = _categoryController.categories[index];
                  final isSelected = _selectedCategory == category.name;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedCategory = category.name;
                      });
                      // Fetch category products only when the category is tapped
                      _categoryController.fetchCategoryProducts(category.id);
                    },
                    child: Container(
                      color: isSelected ? AppTheme.primary : Colors.transparent,
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                      child: Text(
                        category.name,
                        style: TextStyle(
                          color: isSelected ? AppTheme.surface : AppTheme.black,
                          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Right side for Subcategories and Products
            Expanded(
              child: Container(
                color: AppTheme.surface,
                child: (_categoryController.isLoading.value && _categoryController.categoryProducts.isEmpty)
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : (_categoryController.categoryProducts.isEmpty)
                        ? const Center(
                            child: Text(
                              'No products available',
                              style: TextStyle(color: AppTheme.grey, fontSize: 16),
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(12),
                            itemCount: _categoryController.categoryProducts.length,
                            itemBuilder: (context, subCategoryIndex) {
                              final subCategory = _categoryController.categoryProducts[subCategoryIndex];

                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Display Subcategory Name
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8),
                                    child: Text(
                                      subCategory.subCategoryName,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.black,
                                      ),
                                    ),
                                  ),
                                  
                                  // Grid of Products under this Subcategory
                                  GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 10,
                                      mainAxisSpacing: 10,
                                      childAspectRatio: 2 / 3,
                                    ),
                                    itemCount: subCategory.products.length,
                                    itemBuilder: (context, productIndex) {
                                      final product = subCategory.products[productIndex];
                                      return Container(
                                        decoration: BoxDecoration(
                                          color: AppTheme.grey100,
                                          border: Border.all(color: AppTheme.grey300),
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.network(product.imageUrl),
                                            const SizedBox(height: 10),
                                            Text(
                                              product.name,
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text('\$${product.price}', style: TextStyle(color: AppTheme.primary)),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              );
                            },
                          ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
