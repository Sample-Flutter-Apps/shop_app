# shop_app

Shopping App

## Getting Started

* Prepare product overview screen to show the list of products using GridView widget.
* Define product data model.
* Prepare each product item widget using GridTile widget.
* Use ClipRReact to make Tile circular.
* Wrap Image with GuestureDetector to enable Tapping on image.
* Prepare product detail screen.
* Register the route in route table of main.
* Call Navigator in onTap of product image to go to product detail screen and pass product id as argument instead of passing all the data.
* Define provider for Products using provider package.
* Register provider in the main app.
* Register the listener in product detail screen and read data from providers.
* Register the provider for eevry single product (registering provider at product grid level).
* Read the product data in product item widget using provider (no need to paas data through constructor).
* Do improvement to use consumer to build only sepecific part of the widget using Consumer (no need to build the wholw widget).