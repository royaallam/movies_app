import 'package:flutter/material.dart';





class LoginScaner extends StatefulWidget {
  const LoginScaner({super.key});

  @override
  State<LoginScaner> createState() => _LoginScanerState();
}

class _LoginScanerState extends State<LoginScaner> {
  @override
  Widget build(BuildContext context) {
    bool _isLeftSelected = true;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        
        child: Column(
          children: [
            SizedBox(height: 100,),
            Image.asset("assets/images/logo.png", height: 118, width: 120),
           SizedBox(height: 50,),
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
            Container(alignment: Alignment.bottomRight,
              child: Text("Forget Password ?", style: TextStyle(color:Color(0xffF6BD00)
              ))),
              SizedBox(height: 16,),
            Container(
              height: 56,
              width: 392,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                   backgroundColor: Color(0xffF6BD00),
                  side: BorderSide()
                ),
                onPressed: () {}, child: Text("Login",style: TextStyle(
                  color: Colors.black
                ),
                
                )),
            ),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Don`t Have Account ?  ",
                  style: TextStyle(color: Colors.white),
                ),
                InkWell(
//                   onTap: () {
//                     Navigator.of(context).push(MaterialPageRoute<void>(
//       builder: (BuildContext context) => RegisterScaner(),
//     ),
//   );
//                   },
                  child: Text(" Create One", style: TextStyle(color: Color(0xffF6BD00)
                  )),
                ),
              ],
            ),
             SizedBox(height: 16,),
            Text("-------- OR --------", style: TextStyle(color:Color(0xffF6BD00),)),
           
            SizedBox(height: 16,),
            Container(
              height: 56,
              width: 392,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xffF6BD00),
                  
                ),
                child: Text("Login With Google ",style: TextStyle(
                    color: Colors.black
                  ),),
              ),
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
          ])
          )
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
