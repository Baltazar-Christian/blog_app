// import 'dart:io';

// import 'package:blog_app/constant.dart';
// import 'package:blog_app/models/api_response.dart';
// import 'package:blog_app/models/event.dart';
// import 'package:blog_app/services/post_service.dart';
// import 'package:blog_app/services/user_service.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// import '../services/event_service.dart';
// import 'login.dart';

// class AddEventScreen extends StatefulWidget {
//   final Event? event;
//   final String? eventName;
//   final String? startDate;
//   final String? endDate;

//   AddEventScreen({this.event, this.eventName, this.startDate, this.endDate});

//   @override
//   _PostFormState createState() => _PostFormState();
// }

// class _PostFormState extends State<AddEventScreen> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController _txtControllerBody = TextEditingController();
//   final TextEditingController _nameControllerBody = TextEditingController();
//   final TextEditingController _startControllerBody = TextEditingController();
//   final TextEditingController _endControllerBody = TextEditingController();
//   bool _loading = false;
//   File? _imageFile;
//   final _picker = ImagePicker();

//   Future getImage() async {
//     final pickedFile = await _picker.getImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _imageFile = File(pickedFile.path);
//       });
//     }
//   }

//   void _createPost() async {
//     String? image = _imageFile == null ? null : getStringImage(_imageFile);
//     ApiResponse response = await createEvent(
//         _nameControllerBody.text,
//         _txtControllerBody.text,
//         _startControllerBody.text,
//         _endControllerBody.text);

//     if (response.error == null) {
//       Navigator.of(context).pop();
//     } else if (response.error == unauthorized) {
//       logout().then((value) => {
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => Login()),
//                 (route) => false)
//           });
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('${response.error}')));
//       setState(() {
//         _loading = !_loading;
//       });
//     }
//   }

//   // edit event
//   void _editPost(int postId) async {
//     ApiResponse response = await editPost(postId, _txtControllerBody.text);
//     if (response.error == null) {
//       Navigator.of(context).pop();
//     } else if (response.error == unauthorized) {
//       logout().then((value) => {
//             Navigator.of(context).pushAndRemoveUntil(
//                 MaterialPageRoute(builder: (context) => Login()),
//                 (route) => false)
//           });
//     } else {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text('${response.error}')));
//       setState(() {
//         _loading = !_loading;
//       });
//     }
//   }

//   @override
//   void initState() {
//     if (widget.event != null) {
//       _txtControllerBody.text = widget.event!.eventDescription ?? '';
//     }
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Add New Event',
//           style: TextStyle(
//               color: Color.fromARGB(
//                   218, 228, 135, 4), // Replace with your desired text color
//               fontSize: 20 // Optional, adjust the font size as needed
//               // Optional, adjust the font weight as needed
//               ),
//         ),
//         backgroundColor: Colors.black,
//       ),
//       body: _loading
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : ListView(
//               children: [
//                 widget.event != null
//                     ? SizedBox()
//                     : Container(
//                         width: MediaQuery.of(context).size.width,
//                         height: 200,
//                         decoration: BoxDecoration(
//                             image: _imageFile == null
//                                 ? null
//                                 : DecorationImage(
//                                     image: FileImage(_imageFile ?? File('')),
//                                     fit: BoxFit.cover)),
//                         child: Center(
//                           child: IconButton(
//                             icon: Icon(Icons.image,
//                                 size: 50, color: Colors.black38),
//                             onPressed: () {
//                               getImage();
//                             },
//                           ),
//                         ),
//                       ),
//                 Form(
//                   key: _formKey,
//                   child: Padding(
//                     padding: EdgeInsets.all(8),
//                     child: TextFormField(
//                       controller: _txtControllerBody,
//                       // keyboardType: TextInputType.multiline,
//                       // maxLines: 9,
//                       decoration: InputDecoration(labelText: 'Event Name'),
//                       validator: (value) {
//                         if (value == null || value.isEmpty) {
//                           return 'Please enter the event name.';
//                         }
//                         return null;
//                       },
//                       onChanged: (value) {
//                         setState(() {
//                           // eventName = value;
//                         });
//                       },
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 8),
//                   child: kTextButton('Post', () {
//                     if (_formKey.currentState!.validate()) {
//                       setState(() {
//                         _loading = !_loading;
//                       });
//                       if (widget.event == null) {
//                         _createPost();
//                       } else {
//                         _editPost(widget.event!.id ?? 0);
//                       }
//                     }
//                   }),
//                 )
//               ],
//             ),
//     );
//   }
// }
