import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';
  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final _priceFocusNode = FocusNode();
  final _descriptionFocusNode = FocusNode();
  final _imageUrlFocusNode = FocusNode();
  final _imageUrlTextController = TextEditingController();

  Product _editedProduct = new Product(
    id: null,
    title: '',
    price: 0.0,
    description: '',
    imageUrl: '',
  );

  var _initValues = {
    'title': '',
    'description': '',
    'price': '',
    'imageUrl': ''
  };

  var _isInit = true;

  @override
  void initState() {
    super.initState();
    _imageUrlFocusNode.addListener(_changeImageFocus);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      String _productId = ModalRoute.of(context).settings.arguments as String;
      if (_productId != null) {
        _editedProduct = Provider.of<Products>(context).findById(_productId);
        _initValues['title'] = _editedProduct.title;
        _initValues['price'] = _editedProduct.price.toString();
        _initValues['description'] = _editedProduct.description;
        _imageUrlTextController.text = _editedProduct.imageUrl;
      }
    }
    _isInit = false;
  }

  @override
  void dispose() {
    super.dispose();
    _imageUrlFocusNode.removeListener(_changeImageFocus);
    _imageUrlTextController.dispose();
    _priceFocusNode.dispose();
    _descriptionFocusNode.dispose();
    _imageUrlFocusNode.dispose();
  }

  void _changeImageFocus() {
    setState(() {});
  }

  void _saveForm() {
    bool _isValid = _formKey.currentState.validate();
    if (!_isValid) {
      return;
    }
    _formKey.currentState.save();

    if (_editedProduct.id == null) {
      Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    } else {
      Provider.of<Products>(context, listen: false)
          .updateProduct(_editedProduct.id, _editedProduct);
    }

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              _saveForm();
            },
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  initialValue: _initValues['title'],
                  decoration: InputDecoration(
                    labelText: 'Title',
                  ),
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_priceFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = new Product(
                      id: _editedProduct.id,
                      title: value,
                      description: _editedProduct.description,
                      price: _editedProduct.price,
                      imageUrl: _editedProduct.imageUrl,
                      isFavourite: _editedProduct.isFavourite,
                    );
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter title';
                    }
                    return null;
                  },
                  textInputAction: TextInputAction.next,
                ),
                TextFormField(
                  initialValue: _initValues['price'],
                  decoration: InputDecoration(
                    labelText: 'Price',
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  onFieldSubmitted: (value) {
                    FocusScope.of(context).requestFocus(_descriptionFocusNode);
                  },
                  onSaved: (value) {
                    _editedProduct = new Product(
                      id: _editedProduct.id,
                      title: _editedProduct.title,
                      description: _editedProduct.description,
                      price: double.parse(value),
                      imageUrl: _editedProduct.imageUrl,
                      isFavourite: _editedProduct.isFavourite,
                    );
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please the price';
                    }
                    if (double.tryParse(value) == null) {
                      return 'Please enter a valid number';
                    }
                    if (double.parse(value) <= 0) {
                      return 'Enter number > 0';
                    }
                    return null;
                  },
                  focusNode: _priceFocusNode,
                ),
                TextFormField(
                    initialValue: _initValues['description'],
                    decoration: InputDecoration(
                      labelText: 'Description',
                    ),
                    onSaved: (value) {
                      _editedProduct = new Product(
                        id: _editedProduct.id,
                        title: _editedProduct.title,
                        description: value,
                        price: _editedProduct.price,
                        imageUrl: _editedProduct.imageUrl,
                        isFavourite: _editedProduct.isFavourite,
                      );
                    },
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Please enter decsription';
                      }
                      if (value.length < 10) {
                        return 'Description must have atleast 10 characters';
                      }
                      return null;
                    },
                    maxLines: 3,
                    keyboardType: TextInputType.multiline,
                    focusNode: _descriptionFocusNode),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        height: 100,
                        width: 100,
                        margin: EdgeInsets.only(top: 8, right: 10),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                        ),
                        child: _imageUrlTextController.text.isEmpty
                            ? Text('EnterUrl')
                            : FittedBox(
                                fit: BoxFit.cover,
                                child:
                                    Image.network(_imageUrlTextController.text),
                              )),
                    Expanded(
                      child: TextFormField(
                        decoration:
                            InputDecoration(labelText: 'Enter the image url'),
                        controller: _imageUrlTextController,
                        focusNode: _imageUrlFocusNode,
                        keyboardType: TextInputType.url,
                        textInputAction: TextInputAction.done,
                        onSaved: (value) {
                          _editedProduct = new Product(
                            id: _editedProduct.id,
                            title: _editedProduct.title,
                            description: value,
                            price: _editedProduct.price,
                            imageUrl: value,
                            isFavourite: _editedProduct.isFavourite,
                          );
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Please enter image url';
                          }
                          if (!value.startsWith('https') &&
                              !value.startsWith('http')) {
                            return 'Enter valid url';
                          }
                          return null;
                        },
                        onFieldSubmitted: (value) {
                          _saveForm();
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
