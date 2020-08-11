import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {

  final _priceFocusNode = FocusNode(); 
  final _descriptionFocusNode = FocusNode(); 

  @override
  void dispose() {
    super.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Product'),),
      body: Padding(padding: EdgeInsets.all(16),
       child: Form(
         child: SingleChildScrollView(
           child: Column(
             children: [
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'Title',
                 ),
                 onFieldSubmitted: (value) {
                   FocusScope.of(context).requestFocus(_priceFocusNode);
                 },
                 textInputAction: TextInputAction.next,
               ),
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'Price',
                 ),
                 textInputAction: TextInputAction.next,
                 keyboardType: TextInputType.number,
                 onFieldSubmitted: (value) {
                   FocusScope.of(context).requestFocus(_descriptionFocusNode);
                 },
                 focusNode: _priceFocusNode,
               ),
               TextFormField(
                 decoration: InputDecoration(
                   labelText: 'Description',
                 ),
                 maxLines: 3,
                 keyboardType: TextInputType.multiline,
                 focusNode: _descriptionFocusNode
               ),
             ],
           ),
         ),
       ),
      ),
    );
  }
}