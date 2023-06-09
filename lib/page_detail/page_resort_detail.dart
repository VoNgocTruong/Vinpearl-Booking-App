import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vinpearl_app/service_data/resort_data.dart';
import 'package:provider/provider.dart';

import '../cart_page/cart_data.dart';

class ResortPageDetail extends StatefulWidget {
  ResortServiceSnapshot resortServiceSnapshot;
  ResortPageDetail({Key? key, required this.resortServiceSnapshot}) : super(key: key);

  @override
  State<ResortPageDetail> createState() => _ResortPageDetailState();
}

class _ResortPageDetailState extends State<ResortPageDetail> {
  late ResortServiceSnapshot resortServiceSnapshot;
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
                      items:
                        resortServiceSnapshot.resortService.anh
                        .map((item) {
                        return Container(
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
                        Expanded(
                          flex: 4,
                          child: Text("${resortServiceSnapshot.resortService.gia} vnđ", style: const TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 20),)),
                        Expanded(
                          child: Row(
                            children: [
                              const Icon(Icons.star, size: 16, color: Colors.orangeAccent,),
                              Text(resortServiceSnapshot.resortService.xepLoai, style: const TextStyle(fontSize: 16),)
                            ],
                          )
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      resortServiceSnapshot.resortService.tenDV,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Icon(Icons.phone_rounded),
                        const SizedBox(width: 5,),
                        Text(resortServiceSnapshot.resortService.sdt, style: const TextStyle(fontSize: 17),),
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset("assets/images/maps-and-flags.png", width: 20,),
                        const SizedBox(width: 5,),
                        Expanded(
                          child: Text(resortServiceSnapshot.resortService.diaChi, style: const TextStyle(fontSize: 17)))
                      ],
                    ),
                    const SizedBox(height: 20,),
                    const Text("Description", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                    const SizedBox(height: 10,),
                    Text(resortServiceSnapshot.resortService.moTa, style: TextStyle(fontSize: 16),textAlign: TextAlign.justify,)
                  ],
                ),
              ),
              Center(
                child: Container(
                  width: 220,
                  padding: const EdgeInsets.only(bottom: 20, top: 20),
                  child: ElevatedButton(
                    onPressed: () {
                      final cartProvider = Provider.of<CartData>(context, listen: false);

                      if(!cartProvider.isInCart(resortServiceSnapshot)){
                        cartProvider.addItemToCart(resortServiceSnapshot);
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Đã thêm vào giỏ hàng')
                            )
                        );
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text(
                                'Dịch vụ đã có trong giỏ hàng')
                            )
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      elevation: 10,
                      backgroundColor: Colors.orange[300],
                      shadowColor: Colors.grey,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)
                      ),
                      minimumSize: const Size(220, 60),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Add to cart ", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                        Icon(Icons.navigate_next_outlined,)
                      ],
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
    resortServiceSnapshot = widget.resortServiceSnapshot;
  }
}
