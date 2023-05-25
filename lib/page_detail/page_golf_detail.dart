import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vinpearl_app/service_data/golf_data.dart';

class GolfPageDetail extends StatefulWidget {
  GolfServiceSnapshot golfServiceSnapshot;
  GolfPageDetail({Key? key, required this.golfServiceSnapshot}) : super(key: key);

  @override
  State<GolfPageDetail> createState() => _GolfPageDetailState();
}

class _GolfPageDetailState extends State<GolfPageDetail> {
  GolfServiceSnapshot? golfServiceSnapshot;
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
                        "https://statics.vinpearl.com/styles/267x267/public/2022_03/534%20%C3%97%20534%20px-1%20(1)_1648712162.png.webp?itok=3qhlydUA",
                        "https://statics.vinpearl.com/styles/267x267/public/2022_03/534%20%C3%97%20534%20px-2%20(1)_1648712167.png.webp?itok=Bq3HDuWu",
                        "https://statics.vinpearl.com/styles/267x267/public/2022_03/534%20%C3%97%20534%20px-3%20(1)_1648712175.png.webp?itok=h7YCyWTr",
                        "https://statics.vinpearl.com/styles/267x267/public/2022_03/534%20%C3%97%20534%20px-4%20(1)_1648712181.png.webp?itok=6vPD0Uup"
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
                        Text("${golfServiceSnapshot!.golfService.gia} vnđ", style: TextStyle(color: Colors.orangeAccent, fontWeight: FontWeight.bold, fontSize: 20),),
                        SizedBox(width: 130,),
                        Icon(Icons.star, size: 16,),
                        Text("4.6", style: TextStyle(fontSize: 16),)
                      ],
                    ),

                    SizedBox(height: 10,),

                    Text(
                      golfServiceSnapshot!.golfService.tenDV,
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Icon(Icons.phone_rounded),
                        SizedBox(width: 5,),
                        Text(golfServiceSnapshot!.golfService.sdt, style: TextStyle(fontSize: 16),),
                      ],
                    ),

                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Image.asset("assets/images/maps-and-flags.png", width: 20,),
                        SizedBox(width: 5,),
                        Expanded(
                            child: Text(golfServiceSnapshot!.golfService.diaChi, style: const TextStyle(fontSize: 16),))
                      ],
                    ),
                    const SizedBox(height: 10,),
                    Row(
                      children: [
                        const Icon(Icons.mail_outlined),
                        const SizedBox(width: 5,),
                        Text(golfServiceSnapshot!.golfService.email)
                      ],
                    ),

                    SizedBox(height: 20,),
                    const Text("Description", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text(golfServiceSnapshot!.golfService.moTa)
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
    golfServiceSnapshot = widget.golfServiceSnapshot;
  }
}