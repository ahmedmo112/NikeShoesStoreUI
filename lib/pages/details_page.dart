import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';
import 'package:nike_store_ui/models/shoes.dart';
import 'package:nike_store_ui/widgets/custom_button.dart';
import 'package:nike_store_ui/widgets/transition.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.shoes}) : super(key: key);

  final Shoes shoes;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  int valueIndexColor = 0;
  int valueIndexSize = 1;

  double sizeShoes(int index,Size size){
    switch (index) {
      case 0:
        return (size.height*0.09);
        case 1:
        return (size.height*0.07);
        case 2:
        return (size.height*0.05);
        case 3:
        return (size.height*0.04);
      default:
      return (size.height*0.05);
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: -size.height * 0.15,
              right: -size.height * 0.2,
              child: TweenAnimationBuilder<double>(
                duration: const Duration(milliseconds: 250),
                tween: Tween(begin: 0,end:1),
                builder: (context, value,__) {
                  return AnimatedContainer(
                    duration: const Duration(microseconds: 400),
                    height: value * (size.height * 0.5),
                    width: value * (size.height * 0.5),
                    decoration: BoxDecoration(
                      color: widget.shoes.listImage[valueIndexColor].color,
                      shape: BoxShape.circle,
                    ),
                  );
                }
              )),
          Positioned(
              top: kToolbarHeight,
              left: 16,
              right: 16,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomButton(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(
                          Icons.arrow_back_rounded,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {}, 
                        icon: const Icon(Icons.favorite)),
                  ]
                  )
                  ),
          Positioned(
            right: 0,
            left: 0,
            top: size.height*0.2,
              child: FittedBox(
                child: Text(
                          widget.shoes.category,
                          style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[100]),
                        ),
              )),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                top: size.height*0.22,
                right: sizeShoes(valueIndexSize, size),
                left: sizeShoes(valueIndexSize, size),
                child: Hero(
                  tag: widget.shoes.name,
                  child: Image(image: AssetImage(
                  widget.shoes.listImage[valueIndexColor].image,
                              ),
                              ),
                ),
              ),
              Positioned(
                top: size.height*0.6,
                left: 16,
                right: 16,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment:MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ShakeTransition(
                        
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(widget.shoes.category,style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize:16,
                                ),),
                                const SizedBox(height: 8,),
                                Container(
                                  child: Text(widget.shoes.name,style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize:20,
                                  ),
                                  maxLines: 2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ShakeTransition(
                          left: false,
                          child: Text(widget.shoes.price,style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize:20,
                                ),),
                        ),
                      ],
                    ),
                    ShakeTransition(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                        const SizedBox(height: 8,),
                        Row(
                          children: List.generate(5, (index) => Icon(
                            Icons.star,
                            color: widget.shoes.punctuation >index?widget.shoes.listImage[valueIndexColor].color:Colors.white
                            ),
                            ),
                        ),
                        const SizedBox(height: 8,),
                       const Text('SIZE',style:  TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16,
                                  ),),
                        const SizedBox(height: 8,),
                        Row(
                          children: List.generate(4, (index) => Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: CustomButton(
                              onTap: (){
                                valueIndexSize = index;
                                setState(() {});
                              },
                              color: index ==valueIndexSize?
                               widget.shoes.listImage[valueIndexColor].color
                               : Colors.white,
                              child: Text('${index+7}',style:  TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: index ==   valueIndexSize?Colors.white:Colors.black
                                  ),
                                  ),
                              ),
                          ),
                            ),
                        ),
                    
                        ]
                      ),
                    ),

                  ],
                ),
                ),
                Positioned(
                  top:size.height*0.88,
                  left: 16,
                  right: 16,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      ShakeTransition(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('COLOR',style:  TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                    ),),
                                    const SizedBox(height: 8,),
                                    Row(
                                      children:
                                       List.generate(widget.shoes.listImage.length, 
                                       (index) => GestureDetector(
                                         onTap: (){
                                        valueIndexColor=index;
                                        setState(() {});
                                         },
                                         child: Container(
                                           margin: const EdgeInsets.only(right: 8),
                                           height: 30,
                                           width: 30,
                                           decoration: BoxDecoration(
                                             color: widget.shoes.listImage[index].color,
                                             shape: BoxShape.circle,
                                             border: index == valueIndexColor?
                                             Border.all(color: Colors.white,width: 2)
                                             :null
                                           ),
                                         ),
                                       )
                                       ),
                                    )
                          ],
                        ),
                      ),
                      
                      ShakeTransition(
                        left: false,
                        child: CustomButton(
                          width: 100,
                          color: widget.shoes.listImage[valueIndexColor].color,
                          onTap: (){},
                          child: const Text('Buy',style:  TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),),
                        ),
                      )
                    ]
                  )
                  )
        ],
      ),
    );
  }
}
