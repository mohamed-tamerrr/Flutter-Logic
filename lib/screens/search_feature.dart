import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchFeature extends StatefulWidget {
  const SearchFeature({super.key});

  @override
  State<SearchFeature> createState() => _SearchFeatureState();
}

class _SearchFeatureState extends State<SearchFeature> {
  final List<Map> products = [
    {
      "image":
          "https://plus.unsplash.com/premium_photo-1664392147011-2a720f214e01?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "Brown Women Bag",
      "price": 70,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "White Watch 40",
      "price": 130,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1541643600914-78b084683601?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "Men Chanel Perfume",
      "price": 2000,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1572635196237-14b3f281503f?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D",
      "title": "Black Modern Glasses",
      "price": 1400,
    },
    {
      "image":
          "https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2R1Y3R8ZW58MHx8MHx8fDA%3D",
      "title": "Men Nike Shoes",
      "price": 150,
    },
  ];
  List<Map> filteredProducts = [];
  final TextEditingController _searchController =
      TextEditingController();
  void searchProducts(String query) {
    setState(() {
      filteredProducts = products
          .where(
            (product) => product['title'].toLowerCase().contains(
              query.toLowerCase(),
            ),
          )
          .toList();
    });
  }

  void _filterPrices() {
    setState(() {
      filteredProducts = List<Map>.from(products);
      filteredProducts.sort(
        (a, b) => b['price'].compareTo(a['price']),
      );
    });
  }

  void _filterAlpha() {
    setState(() {
      filteredProducts = List<Map>.from(products);
      filteredProducts.sort(
        (a, b) => a['title'].compareTo(b['title']),
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  initState() {
    super.initState();
    filteredProducts = products;
  }

  Widget _categoryChip(String label) {
    return GestureDetector(
      onTap: () {
        searchProducts(label);
      },
      child: Container(
        width: 70,
        height: 30,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(child: Text(label)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.pink.shade900,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 120),

                /// Search text field
                SizedBox(
                  height: 40,
                  child: TextField(
                    controller: _searchController,
                    onChanged: searchProducts,
                    cursorColor: Colors.black,
                    cursorHeight: 15,
                    decoration: InputDecoration(
                      hintText: "Search",
                      prefixIcon: const Icon(
                        CupertinoIcons.search,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 3,
                      ),
                      enabledBorder: const OutlineInputBorder(),
                      focusedBorder: const OutlineInputBorder(),
                      filled: true,
                      fillColor: Colors.grey.shade300,

                      suffixIcon:
                          _searchController.text != "" &&
                              _searchController.text.isNotEmpty
                          ? GestureDetector(
                              onTap: () {
                                _searchController.clear();
                                searchProducts('');
                              },
                              child: Icon(
                                Icons.clear,
                                color: Colors.black,
                                size: 22,
                              ),
                            )
                          : null,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                /// Categories
                Row(
                  children: [
                    _categoryChip("All"),
                    const SizedBox(width: 10),
                    _categoryChip("Men"),
                    const SizedBox(width: 10),
                    _categoryChip("Women"),
                    const SizedBox(width: 10),
                    _categoryChip("Nike"),
                  ],
                ),

                const SizedBox(height: 30),

                /// Filter row
                Row(
                  children: [
                    GestureDetector(
                      onTap: _filterPrices,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.filter_alt,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "Highest to Lowest",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(width: 10),

                    GestureDetector(
                      onTap: _filterAlpha,
                      child: Row(
                        children: [
                          const Icon(
                            Icons.filter_list_sharp,
                            color: Colors.white,
                          ),
                          const SizedBox(width: 5),
                          const Text(
                            "A - Z",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          filteredProducts = products;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 8,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(
                            30,
                          ),
                        ),
                        child: const Row(
                          children: [
                            Icon(
                              Icons.clear,
                              color: Colors.white,
                              size: 15,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Clear Filter",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 15),

                /// Product list
                Column(
                  children: List.generate(
                    filteredProducts.length,
                    (index) {
                      final product = filteredProducts[index];
                      return ListTile(
                        contentPadding:
                            const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                        leading: Container(
                          width: 70,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                              12,
                            ),
                            child: Image.network(
                              product['image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        title: Text(
                          product['title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        trailing: Text(
                          "${product['price']}\$",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
 //TODO : X button is not showing when text is empty, need to see that.
 //TODO : When we click on category chips, need to see that. 