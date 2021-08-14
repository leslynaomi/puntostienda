import 'package:flutter/material.dart';
class WishlistEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(top: 80),
          width: double.infinity,
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/emptycart.png'),
            ),
          ),
        ),
        Text('tu lista de deseos esta vacia', 
        textAlign: TextAlign.center,
        style: TextStyle(color:Colors.black,
        fontSize: 36,
        fontWeight: FontWeight.w600),
        ),
        SizedBox(height:20 ,),
         Text('parece que todavía no has añadido nada a tu lista', 
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black,
        fontSize: 26,
        fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 20,),
         Container(
           width:MediaQuery.of(context).size.width * 0.9,
           height:MediaQuery.of(context).size.height * 0.06, 
           child: ElevatedButton(
             
              child: Text('añadir un deseo'.toUpperCase(), 
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w600),),
              onPressed: () {
                // Navigator.of(context).push('login');
                
              },
              style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
             borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.redAccent)
            )
        )
      )
               ),
         ),

      ],
    );
  }
}
