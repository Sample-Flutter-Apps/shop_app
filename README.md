# Shopping App
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
* Add Filter for show Favorites by converting Products Overview Screen to stateful widget as we only want to show Favorites filter to applied to this screen not globally so we refresh the widget in onState method and then pass the showFavorite to each product grids where we can filter the data based on the flag.
* Use ChangeNotifierProvider.value if you have already created an instance of the ChangeNotifier class. This type of situation might be happen if you had initialized your ChangeNotifier class in the initState() method of your StatefulWidget's State class.
In that case, you wouldn't want to create a whole new instance of your ChangeNotifier because you would be wasting any initialization work that you had already done. Using the ChangeNotifierProvider.value constructor allows you to provide your pre-created ChangeNotifier value.Take special note that there isn't a create parameter here, but a value parameter. That's where you pass in your ChangeNotifier class instance. Again, don't try to create a new instance there.
* Add cart data provider & define cart item data model.
* Register Cart provider in main app, change single ChangeNotifierProvider to MultiProvider.
* Add Badge as App Bar action and then warp it with Consumer to listen to changes to Cart Provider.
* Add Cart Screen and add widgets to it, use Chip, Spacer, Card widgets etc.
* To display items of the cart we have to add List to column which cannot be inserted directly so we have wrap it with Expanded widget.
* For each individual item create Cart Item widget using Card, ListTile, FittedBox widgets.
* Add functionality of deleting individual item from the list using Dismmisable widget and custoimize according to the needs.
* Add few widgets to product detail screen just for showing purpose.