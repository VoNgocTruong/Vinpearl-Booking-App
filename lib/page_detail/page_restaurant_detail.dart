import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vinpearl_app/service_data/restaurant_data.dart';

class RestaurantPageDetail extends StatefulWidget {
  RestaurantServiceSnapshot restaurantServiceSnapshot;
  RestaurantPageDetail({Key? key, required this.restaurantServiceSnapshot}) : super(key: key);

  @override
  State<RestaurantPageDetail> createState() => _RestaurantPageDetailState();
}

class _RestaurantPageDetailState extends State<RestaurantPageDetail> {
  RestaurantServiceSnapshot? restaurantServiceSnapshot;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  children: [
                    CarouselSlider(
                      options: CarouselOptions(
                        height: MediaQuery.of(context).size.height * 0.36,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                      ),
                      items: [
                        "https://statics.vinpearl.com/styles/image800x600/public/2021_08/nha-hang-lagoon-vinpearl-nha-trang-2_1628430565.jpg.webp?itok=HMJVlJEc",
                        "https://statics.vinpearl.com/styles/image800x600/public/2021_08/nha-hang-lagoon-vinpearl-nha-trang-4_1628430567.jpg.webp?itok=cjzpo_8v",
                        "https://statics.vinpearl.com/styles/image800x600/public/2021_08/nha-hang-lagoon-vinpearl-nha-trang-6_1628430569.jpg.webp?itok=T_BAk13M",
                        "https://statics.vinpearl.com/styles/image800x600/public/2021_08/nha-hang-lagoon-vinpearl-nha-trang-3_1628430566.jpg.webp?itok=NHuylN8B"
                        // Add more image URLs here
                      ].map((item) {
                        return Container(
                          padding: const EdgeInsets.only(top: 10),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                            child: Image.network(
                              item,
                              width: MediaQuery.of(context).size.width,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                    Positioned(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white,),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                            Expanded(child: Container()), // To align the title to the center, you can use an Expanded widget
                          ],
                        ),
                      ),
                    ),
                  ]
              ),
              Container(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        //Giá
                        Text("${restaurantServiceSnapshot!.restaurantService.gia} vnđ", style: const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 17),),
                        const SizedBox(width: 130,),
                        const Icon(Icons.star, size: 16,),
                        Text(restaurantServiceSnapshot!.restaurantService.xepLoai, style: const TextStyle(fontSize: 16),)
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      restaurantServiceSnapshot!.restaurantService.tenDV,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.phone_rounded),
                        SizedBox(width: 5,),
                        Text(restaurantServiceSnapshot!.restaurantService.sdt, style: const TextStyle(fontSize: 16),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset("assets/images/maps-and-flags.png", width: 20,),
                        SizedBox(width: 5,),
                        Expanded(
                            child: Text(restaurantServiceSnapshot!.restaurantService.diaChi, style: TextStyle(fontSize: 16),))
                      ],
                    ),
                    const SizedBox(height: 10,),
                    const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Text(restaurantServiceSnapshot!.restaurantService.moTa)
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      // Add service to cart logic goes here
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add to cart ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
                        Icon(Icons.navigate_next_outlined,)
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      primary: Colors.orange[300],
                      minimumSize: Size(220, 60),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    restaurantServiceSnapshot = widget.restaurantServiceSnapshot;
  }
}
