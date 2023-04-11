import 'package:flutter/material.dart';

class ManageProfile extends StatefulWidget {
  const ManageProfile({Key? key}) : super(key: key);

  @override
  State<ManageProfile> createState() => _ManageProfileState();
}

enum Gender {Male, Female}

class _ManageProfileState extends State<ManageProfile> {

  Gender gender = Gender.Male;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(
                "Profile updated"
              )));
            },
            icon: Icon(Icons.edit),
          ),
          // TextButton(onPressed: (){},child: Text("Save",style: TextStyle(color: Colors.white),),),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Choose source",),
                            
                            actions: [
                              TextButton(onPressed: (){}, child: Text("Camera",),),
                              TextButton(onPressed: (){}, child: Text("Gallery",),),
                            ],
                          );
                        }
                      );
                    },
                    child: CircleAvatar(
                      radius: 45,
                      backgroundImage: AssetImage("assets/images/user.jpg"),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Divider(
              height: 2,
              thickness: 8,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right:15),
              child: TextFormField(
                initialValue: "Paul",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: "First name",
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right:15),
              child: TextFormField(
                initialValue: "Smith",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: "Last name",
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right:15),
              child: TextFormField(
                initialValue: "paulsmith12@gmail.com",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: "Email",
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right:15),
              child: TextFormField(
                initialValue: "9898096762",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: "Mobile number",
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left:15,right:15),
              child: Row(
                children: [
                  Text("Gender:",style: TextStyle(fontSize: 18),),
                  Radio(
                  value: Gender.Male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      // card = value;
                    });
                  },
                ),
                Text("Male",style: TextStyle(fontSize: 16),),
                SizedBox(
                  width: 20,
                ),
                Radio(
                  value: Gender.Female,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      // card = value;
                    });
                  },
                ),
                Text("Female",style: TextStyle(fontSize: 16),),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 2,
              thickness: 8,
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right:15),
              child: TextFormField(
                initialValue: "3158 Center Street",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: "Address Line1",
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right:15),
              child: TextFormField(
                initialValue: "Eugene Oregon",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: "Address Line1",
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right:15),
              child: TextFormField(
                initialValue: "Goleta",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: "City",
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right:15),
              child: TextFormField(
                initialValue: "California",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: "State",
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15,right:15),
              child: TextFormField(
                readOnly: true,
                initialValue: "02048",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(color: Colors.blue.shade300),
                  ),
                  hintText: "Zip code",
                  
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
