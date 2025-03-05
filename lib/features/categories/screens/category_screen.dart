import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  final Map<String, List<String>> _categories = {
    'Electronics': ['Phone', 'Laptop', 'Headphones', 'Camera'],
    'Clothing': ['T-Shirts', 'Jeans', 'Jackets', 'Shoes'],
    'Home Appliances': ['Refrigerator', 'Microwave', 'Washing Machine', 'Air Conditioner'],
    'Books': ['Fiction', 'Science', 'History', 'Biography'],
  };

  String _selectedCategory = 'Electronics';
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 70,
        title: Container(
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search categories...',
              hintStyle: TextStyle(color: Colors.grey.shade600),
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search, color: Colors.grey.shade600),
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
      body: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.3,
            color: Colors.grey.shade200,
            child: ListView.builder(
              itemCount: _categories.keys.length,
              itemBuilder: (context, index) {
                final category = _categories.keys.elementAt(index);
                final isSelected = _selectedCategory == category;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedCategory = category;
                    });
                  },
                  child: Container(
                    color: isSelected ? Colors.black : Colors.transparent,
                    padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                    child: Text(
                      category,
                      style: TextStyle(
                        color: isSelected ? Colors.white : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          Expanded(
            child: Container(
              color: Colors.white,
              child: (_categories[_selectedCategory]!
                      .where((item) => item.toLowerCase().contains(_searchQuery))
                      .isEmpty)
                  ? const Center(
                      child: Text(
                        'No products found',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      ),
                    )
                  : GridView.builder(
                      padding: const EdgeInsets.all(12),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 2 / 3,
                      ),
                      itemCount: _categories[_selectedCategory]!
                          .where((item) => item.toLowerCase().contains(_searchQuery))
                          .length,
                      itemBuilder: (context, index) {
                        final filteredList = _categories[_selectedCategory]!
                            .where((item) => item.toLowerCase().contains(_searchQuery))
                            .toList();
                        final subProduct = filteredList[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.shopping_bag,
                                size: 40,
                                color: Colors.grey.shade700,
                              ),
                              const SizedBox(height: 10),
                              Text(
                                subProduct,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
