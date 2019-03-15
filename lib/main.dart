import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';



void main(){
  runApp(
    MaterialApp(
      title: 'Google Auth',
      home: Gsignin(),
      
      debugShowCheckedModeBanner: false,
    
    )
  );
}

class Gsignin extends StatelessWidget{
final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn =GoogleSignIn();

Future<FirebaseUser> _handleSignIn() async {
 final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );



  FirebaseUser user = await _auth.signInWithCredential(credential);
  print("signed in " + user.displayName);
  return user;
}

void _signout(){
  _googleSignIn.signOut();
  print('user signout');
}

  @override
  Widget build(BuildContext context){
    return new Scaffold(
    
      body: Stack( children: <Widget>[


          
        new Container(
          decoration: BoxDecoration(
          
            
            image: DecorationImage(
              image: AssetImage("images/a.jpg"),
              fit: BoxFit.fitHeight,
              
              
              
              
            )
            
          ),
         
        ),

        


         

              
                new Column(
                  
            
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[



            Container(padding: EdgeInsets.only(bottom: 100.0),
              child: new Text('---GOOGLE SIGN PAGE---', style:new TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
            

             new FlatButton( 
                            shape: new RoundedRectangleBorder(
                              
                              borderRadius: new BorderRadius.circular(30.0),
                              
                            ),
                            color: Color(0Xffdb3236),
                            onPressed: () => {},
                            child: new Container(
                             
                              child: new Row(
                               
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Expanded(
                                    child: new FlatButton(
                                      onPressed: (()  {
                                         _handleSignIn().then((FirebaseUser user) => print(user) )
                                        .catchError((e) => print(e));
                                        
                                      }),
                                      padding: EdgeInsets.only(
                                        top: 20.0,
                                        bottom: 20.0,
                                      ),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: <Widget>[
                                          Icon(
                                            const IconData(0xea88,
                                                fontFamily: 'icomoon'),
                                            color: Colors.white,
                                            size: 15.0,
                                          ),
                                          Text(
                                            "GOOGLE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15.0,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                new Container(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                 new OutlineButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    color: Colors.redAccent,
                    highlightedBorderColor: Colors.white,
                    onPressed:( ()  {_signout();
                 
                    }),
                    child: new Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 20.0,
                        horizontal: 20.0,
                      ),
                      child: new Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          new Expanded(
                            child: Text(
                              "SIGN OUT",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                



            


        
            ],
          ),
      ],
      ),
    );
  }
}