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
* Add Place Order functionality by adding new Orders Provider and define order & order item data model, add respective methods and then call add order logic from Place order onPressed.
* Add Orders Screen to show all the orders and then create order item widget to show each order using Card, ListTile, Column widgets.
* Create App drawer widget using Drawer, Divider, ListTile widgets and add to Shop & Orders page to go Product Overview Screen & Orders Page.
* Add expanded functionality to order item card by using setState of order item widget by converting it into stateful widget.

* Add Snackbar to show message "item added" and also SnackBarAction to undo the action.
* Add Dialog on Cart screen on dismissing any cart item, Alert Dialog to get confirmation from user.
* Prepare user prodcuts screen & user product item widget using ListView, ListTile, CircleAvatar etc.
* Add Edit Product Screen which contains Form Widget & Form Items with SingleChildScrollableView with column so the items becomes scrollable if list gets too large (with ListView once gets out of scope the data is lost).
* Add FormTextField add InputType, InputAction, OnSubmitted, ChangingFocus etc.
* Add Description and also dispose FocusNodes to avoid memory leaks.
* Add Image Url field and Image viewer to view image when image is entered and done is pressed or focus is removed.
* Add Form Submit function to trigger form save functionality.
* Add validation to form and run validators for all text fields before save and check if evrything is fine then run save.
* On Save add product using Products provider and pop the page to go back to previous list.
* Update product on click of edit and update the using provider, setting initial valus for the existing product using initValues and textcontroller is case if controller is used.
* Add Delete functionality by using provider.

* Add http calls to add product using firebase realtime database.
* Add loading spinnner using Future of http post.
* Add error handling using catch error of future calls.
* Making method async automatically makes method to return Future<void>.
* Convert the http method calls to async await and replace then with try-catch-finally blocks.

* Fetch the products from firebase in didChangeDependencies lfecycle method as will be called often to avoid maintain a flag and just turn it off after first run and initialize data there.
* Provider.of(context) will not work inInit method as of(context) does not work there its not wired completely.
* Add pull to refresh functionality on user product screen by RefreshIndicator widget and then call products provider to get and set the products.
* Add update product functionality by send patch request to firebase.
* Add delete product functionality using optimistic delete approach.
* Add isFavourite functionality by adding patch request in Product provider class using optimistic update.

* Add order in firebase by post data in order provider method.
* Add functionality to fetch and set order to provider & call it in inInit lifecycle method (first convert it to Stateful Widget) of OrderScreen with using Future delayed functionality and registering a callback to set to fetch and set the orders.
* An alternate for above point is to use FutureBuilder (convert it back to Stateless widget) and give your provider data to future and then in builder based on ConnectionState of dataSnaphot show your widgets, for list wrap it with Consumers<Orders> so it rebuilds on changes.

* Add Auth Screen.
* Create Auth Provider to handle auth logic for signUp & signIn.
* Add error for signUp & signIn funcionality.
* Make main dart MaterialApp widget consumer of auth provider so if anything changes with auth the widget is re-rendered.
* It also help to check if Auth provider has valid then decide whether to go to Login or Product Overview Screen.
* After signUp or signIn set the userId, expiryDate, Token from response and then notifyListeners so that Consumers can listen to it like MatreialApp in main file.

* To pass auth token to Products Provider we can create a constructor to get token and change it registration of ChangeNotifierProvider to ChangeNotifierProxyProvider which can also trigger with the change in other provider so we can declare it as a proxy for Auth and target for Products so in update we will get auth object & previous state of target which is Products hence we can pass both the data to Products provider constructor and then attach the token to every HTTP request.
* Add token to change favourite status request we can pass token in the method by getting data using Auth Provider.
* For Orders also to get the token use the same trick used for Products provider.
* Also adjust to query to show all products in ProductOverviewScreen & only user created products in UserProductsScreen so in that case we can FutureBuilder which in future can trigger the call to our Provider to get user filtered data and wrap our list with the Consumer of Products so that part is rebuilds when there is change in Products provider in addition to avoid any infinite loop if we listen to Products provider for the whole widget.
* Adjust orders request for userId by adding userId for all HTTP request.
* Add logout functionality, add logout button to App drawer and then onPressed set all the auth object proeprties to null and just notify the listeners also pop the app drawer from widget stack.
* Adding AutoLogout functionality by starting a Timer for duration of token expire and then register the logout method after the timer is over and also cancel the timer once its logout.
* Add AutoLogin functionality by storing logged in user data in device memory using shared preferences, then using Future try to fetch user data during starting of app from device if found then check if its valid or not found depend on that show the relevant screen.
* Also on Logout by user remember to clear shared preferences data so that is does not auto login again.
* Also On Logout navigate to home screen so that your Auth logic in main dart always runs after logout just to avoid unexpected behaviour.

