import 'package:flutter/material.dart';
import 'package:nike_store_ui/models/shoes.dart';

final listCategory = ['Basketball','Running','Traning'];

final listShoes =[
  Shoes('AIR JORDAN 1 MID SE GC', 'NIKE AIR', '\$120.00', 4, [
    ImageShoes('assets/J_001.png', const Color(0xffEAA906)),
    ImageShoes('assets/J_002.png', const Color(0xff08B894)),
    ImageShoes('assets/J_003.png', const Color(0xffB50D0D)),
    ImageShoes('assets/J_004.png', const Color(0xff229954)),
  ]),
   Shoes('NIKE BLAZER MID', 'NIKE AIR', '\$150.00', 3, [
    ImageShoes('assets/Z_001.png', const Color(0xff08B894)),
    ImageShoes('assets/Z_002.png', const Color(0xffE90311)),
    ImageShoes('assets/Z_003.png', const Color(0xff189E03)),
    ImageShoes('assets/Z_004.png', const Color(0xffF76A02)),
  ]),
   Shoes('ZoomX Vaporfly', 'NIKE ZOOM', '\$180.00', 4, [
    ImageShoes('assets/N_001.png', const Color(0xff7B7A41)),
    ImageShoes('assets/N_002.png', const Color(0xff2C2C56)),
    ImageShoes('assets/N_003.png', const Color(0xff262626)),
    ImageShoes('assets/N_004.png', const Color(0xff5C9462)),
  ]),

];

