import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Descript extends StatelessWidget {
  const Descript({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 13),
        Container(
           padding: EdgeInsets.symmetric(
            vertical:/*getProportionateScreenWidth*/(15),
            horizontal: /*getProportionateScreenWidth*/(30),
          ),
          child: SafeArea(
            child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( 
                                  'Receipt Number:',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 14),
                                ),
                             Text( 
                                  'Sample Number',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w500,fontSize: 14),
                                ),
                          ],
                        ),
                    SizedBox(height: /*getProportionateScreenHeight*/(8)),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( 
                                  'Customer Name:',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 14),
                                ),
                             Text( 
                                  'Sample Name',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w500,fontSize: 14),
                                ),
                          ],
                        ),
                        SizedBox(height: /*getProportionateScreenHeight*/(8)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( 
                                  'Customer Number:',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 14),
                                ),
                             Text( 
                                  'Sample Number',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w500,fontSize: 14),
                                ),
                          ],
                        ), 
                        SizedBox(height: /*getProportionateScreenHeight*/(8)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( 
                                  'Date:',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 14),
                                ),
                             Text( 
                                  'Sample Date',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w500,fontSize: 14),
                                ),
                          ],
                        ), 
                        SizedBox(height: /*getProportionateScreenHeight*/(30)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text( 
                                  'Total:',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w600,fontSize: 15),
                                ),
                             Text( 
                                  '\$150',
                                   style: GoogleFonts.lato(textStyle:TextStyle(color: Colors.black),fontWeight:FontWeight.w700,fontSize: 15),
                                ),
                          ],
                        ), 
                        
               ]
            ),
          ),
        ),
      ],
    );
  }
}