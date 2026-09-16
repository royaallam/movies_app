import 'package:flutter/material.dart';

import 'package:movies_app/login_scanner.dart';

class RegisterScaner extends StatefulWidget {
  const RegisterScaner({super.key});

  @override
  State<RegisterScaner> createState() => _RegisterScanerState();
}

class _RegisterScanerState extends State<RegisterScaner> {
  @override
  
  Widget build(BuildContext context) {
     bool _isLeftSelected = true;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Padding(
      padding: const EdgeInsets.all(25.0),
      child: Column(
        children: [
         SizedBox(height: 16,),
         Container(
           height: 161,
           width: 394,
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset("assets/images/logo.png",
              width: 94,height: 94,),
               Image.asset("assets/images/logo.png",
               width: 158,
               height: 161,),
                Image.asset("assets/images/logo.png",
                width: 94,height: 94,),
      
            ],
           ),
         ),
         SizedBox(height: 16,),
         TextFormField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff282A28),
                hintText: "Name ",
                prefixIcon: Icon(Icons.perm_identity, color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  //borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xff282A28), width: 2),
                ),
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff282A28),
                hintText: "Email ",
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  //borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Color(0xff282A28), width: 2),
                ),
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff282A28),
                hintText: "Password ",
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                ),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                 // borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.none,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff282A28),
                hintText: "Confim Password ",
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                ),
                prefixIcon: Icon(Icons.email, color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                 // borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
            SizedBox(height: 16,),
            TextFormField(
              cursorColor: Colors.white,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xff282A28),
                hintText: "Phone Number",
                suffixIcon: Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                ),
                prefixIcon: Icon(Icons.call, color: Colors.white),
                hintStyle: TextStyle(color: Colors.white),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                 // borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
               SizedBox(height: 16,),
            Container(
              height: 56,
              width: 392,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF6BD00),
                  
                ),
                child: Text("Create Account",style: TextStyle(
                    color: Colors.black
                  ),),
              ),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already Have Accont ",
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => LoginScaner(),
    ),
  );
                  },
                  child: Text("Login", style: TextStyle(color: Color(0xffF6BD00)
                  )),
                ),
              ],
            ),
             SizedBox(height: 16,),
            GestureDetector(
      onTap: () {
        setState(() {
          _isLeftSelected = !_isLeftSelected;
        });
      },
      child: Container(
        width: 180,
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFFD4AF37), 
          borderRadius: BorderRadius.circular(35),
          border: Border.all(color: const Color(0xFF8B7355), width: 4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Stack(
            children: [
             
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildCircleFlag('assets/images/usa.png'),
                  _buildCircleFlag("assets/images/egpyt.jpeg"),
                ],
              ),
              
              Align(
                alignment: _isLeftSelected 
                    ? Alignment.centerLeft 
                    : Alignment.centerRight,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: const Color(0xFF8B7355), width: 5),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
        ],
      ),
    )),
    );

  }
}
 Widget _buildCircleFlag(String assetPath) {
    return Container(
      width: 58,
      height: 58,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
      ),
      clipBehavior: Clip.antiAlias,
      child: Image.asset(
        assetPath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => const Icon(Icons.flag),
      ),
    );
  }