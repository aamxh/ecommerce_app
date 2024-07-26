import 'package:ecommerce_app/config/brands.dart';
import 'package:ecommerce_app/config/constants.dart';
import 'package:ecommerce_app/config/popular_categories.dart';
import 'package:ecommerce_app/controllers/main.dart';
import 'package:ecommerce_app/models/product.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

class HomeW extends StatelessWidget {

  const HomeW({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            color: theme.primaryColor,
            height: size.height * 0.64,
            width: size.width,
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Column (
                  children: [
                    SizedBox(height: size.height * 0.05,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'A good day for shopping,',
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'AAMXH',
                              style: theme.textTheme.bodyLarge!.copyWith(
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.01,),
                    const SearchBar(isInHome: true),
                    SizedBox(height: size.height * 0.02,),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Popular Categories',
                        style: theme.textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01,),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        itemCount: 6,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, idx) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 14),
                            child: Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white,
                                  ),
                                  child: ClipOval(
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: Image.asset(
                                        MyPopularCategories.icons[idx],
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 7),
                                SizedBox(
                                  width: 50,
                                  child: Text(
                                    MyPopularCategories.names[idx],
                                    style: theme.textTheme.bodyMedium!.copyWith(
                                      color: Colors.white,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: theme.scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: EdgeInsets.all(size.width * 0.05),
                width: size.width,
                height: size.height,
                child: Column(
                  children: [
                    SizedBox(height: size.height * 0.02,),
                    CarouselSlider(
                      options: CarouselOptions(
                        onPageChanged: (newIdx, _) =>
                            Get.find<CarouselSliderC>().updateIdx(newIdx),
                        height: size.height * 0.2),
                      items: const [
                        CarouselSliderW(
                          image: 'assets/images/additional_image1.png',
                        ),
                        CarouselSliderW(
                          image: 'assets/images/additional_image2.png',
                        ),
                        CarouselSliderW(
                          image: 'assets/images/additional_image3.png',
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        for (int i = 0; i < 3; i++)
                          Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: GetBuilder<CarouselSliderC>(
                              init: CarouselSliderC(),
                              builder: (ctrl) => Container(
                                decoration: BoxDecoration(
                                  color: ctrl.idx == i ?
                                  theme.primaryColor :
                                  MyConstants.neutral,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                width: 10,
                                height: 10,
                              ),
                            ),
                          ),
                      ],
                    ),
                    SizedBox(
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8,
                          mainAxisExtent: size.height * 0.3,
                        ),
                        itemCount: 4,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, idx) {
                          return const ProductW(product: ProductM(
                              name: "The product's name here",
                              discountPercent: 20,
                              number: 2,
                              rating: 4,
                              brand: 'Nike',
                              price: 200,
                              image: ['assets/images/bill.png'],
                          ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}

class SearchBar extends StatelessWidget {

  const SearchBar({super.key, required this.isInHome});

  final bool isInHome;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      decoration: InputDecoration(
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search, color: MyConstants.neutral,),
        ),
        filled: true,
        fillColor: isInHome ? Colors.white : theme.scaffoldBackgroundColor,
        hintText: 'Search in store',
      ),
    );
  }

}

class CarouselSliderW extends StatelessWidget {

  const CarouselSliderW({
    required this.image,
    super.key,
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {},
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(
            image,
            width: size.width * 0.8,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

}

class ProductW extends StatelessWidget {

  const ProductW({
    super.key,
    required this.product
  });

  final ProductM product;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MyConstants.neutral),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.15,
                  child: Stack(
                    children: [
                      Container(color: Colors.white,),
                      Align(
                        alignment: Alignment.center,
                        child: Image.asset(
                          product.image[0],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        child: product.discountPercent == 0 ?
                        Container() :
                        Container(
                          decoration: BoxDecoration(
                            color: MyConstants.red,
                            borderRadius: BorderRadius.circular(30),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          child: Text(
                            '${product.discountPercent.toInt()}%',
                            style: theme.textTheme.bodyMedium!.apply(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: const Icon(
                            Icons.favorite_border,
                            color: MyConstants.neutral,
                            size: 30,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: size.height * 0.01,),
                Text(
                  product.name,
                  style: theme.textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          product.brand,
                          style: theme.textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(height: size.height * 0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${product.price.toInt()} \$',
                            style: theme.textTheme.bodyMedium,
                          ),
                          Text(
                            '${product.rating}',
                            style: theme.textTheme.bodySmall!.apply(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
          ),
      ),
    );
  }

}

class StoreW extends StatelessWidget {

  const StoreW({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.06,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Store',
                    style: theme.textTheme.headlineSmall,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.shopping_cart_rounded),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.03),
            const SearchBar(isInHome: false,),
            SizedBox(height: size.height * 0.04,),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Featured Brands',
                    style: theme.textTheme.titleMedium,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'View all',
                      style: theme.textTheme.bodyLarge!.apply(
                        color: theme.primaryColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: size.height * 0.13,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemCount: 4,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, idx) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: MyConstants.neutral),
                  ),
                  child: BrandW(idx: idx),
                );
              },
            ),
            SizedBox(height: size.height * 0.04,),
            GetBuilder<TabBarC>(
              init: TabBarC(),
              builder: (ctrl) => Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                    child: ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, idx) {
                        return Padding(
                          padding: idx == 5 ?
                          EdgeInsets.zero :
                          EdgeInsets.only(right: size.width * 0.05),
                          child: GestureDetector(
                            onTap: () => ctrl.changeIdx(idx),
                            child: Text(
                              MyPopularCategories.names[idx],
                              style: ctrl.idx == idx ? theme.textTheme.bodyLarge!
                                  .apply(color: theme.primaryColor) :
                              theme.textTheme.bodyLarge,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.01,),
                  SizedBox(
                    height: size.height * 0.5,
                    child: ctrl.categories[ctrl.idx],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class BrandW extends StatelessWidget {

  const BrandW({super.key, required this.idx});

  final int idx;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          theme.brightness == Brightness.dark ?
          MyBrands.darkBrandsLogos[idx] :
          MyBrands.lightBrandsLogos[idx],
          height: size.height * 0.07,
          width: size.height * 0.07,
        ),
        SizedBox(width: size.width * 0.02,),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  MyBrands.brands[idx],
                  style: theme.textTheme.bodyLarge,
                ),
                const SizedBox(width: 5,),
                Image.asset(
                  'assets/logos/verified.png',
                  height: size.height * 0.018,
                  width: size.height * 0.018,
                ),
              ],
            ),
            Text(
              '+30 products',
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }

}

class Brand2W extends StatelessWidget {

  const Brand2W({super.key, required this.idx});

  final int idx;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    return Container(
      height: size.height * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: MyConstants.neutral),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                theme.brightness == Brightness.dark ?
                MyBrands.darkBrandsLogos[idx] :
                MyBrands.lightBrandsLogos[idx],
                height: size.height * 0.07,
                width: size.height * 0.07,
              ),
              SizedBox(width: size.width * 0.02,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        MyBrands.brands[idx],
                        style: theme.textTheme.bodyLarge,
                      ),
                      const SizedBox(width: 5,),
                      Image.asset(
                        'assets/logos/verified.png',
                        height: size.height * 0.018,
                        width: size.height * 0.018,
                      ),
                    ],
                  ),
                  Text(
                    '+30 products',
                    style: theme.textTheme.bodySmall,
                  ),
                ],
              ),
            ],
          ),

        ],
      ),
    );
  }

}

class WishListW extends StatelessWidget {

  const WishListW({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.black54,);
  }

}

class ProfileW extends StatelessWidget {

  const ProfileW({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView();
  }

}