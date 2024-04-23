
import 'package:url_launcher/url_launcher.dart';

const String kBaseUrl = "suezsteel.addictaco.com";
const String kBaseVersion = 'api/';
const String paginationPerPage = '15';

// end points
const String kSignIn = 'auth/login';
const String kSignUp = 'auth/register';
const String kVerifyOtp = 'auth/verify';
const String kResendOtp = 'auth/resend-verify';
const String kForgetPassword = 'auth/forgot';
const String kResetPassword = 'auth/reset-password';
const String kResendForgetOtp = 'auth/resend-forgot';
const String kGetCustomerTypes = 'customer-types';
const String kProfile = 'profile';
const String kContactUs = 'contact-us';
const String kAbout = 'about';
const String kPrivacy = 'policy';
const String kGetAddresses= 'addresses';
const String kCountries= 'countries';
const String kProducts= 'products';
const String kServices= 'services';
const String kCategories= 'categories';
const String kUserHome = 'mobile-home';
const String kBlogs = 'blogs';




//not used end poinnts
const String kProductDetails = 'product';
const String kChangeLanguage = 'change-lang';
const String kUpdatePassword = 'update-passward';
const String kListCommodities = 'commodities';
const String kAddItemToCart = 'cart/add';
const String kCarts = 'cart/list';
const String kUpdateQuantity = 'cart/update';
const String kRemoveItemFromCartCart = 'cart';
const String kSaveItemForLater = 'cart/save-for-later';
const String kAddItemToFavourite = 'favourites/add';
const String kFavourite = 'favourites/list';
const String kFavouritesUpdateQuantity = 'favourites/update';
const String kRemoveItemFromFavourites = 'favourites';
const String kSaveItemToCart = 'favourites/move-to-cart';
const String kListAllCategories = 'list-categories';
const String kListAllBestSelling = 'all-best-selling';
const String kListAllBestOffers = 'all-best-offer';
const String kListAllNewCollections= 'all-new-collection';
const String kCategoryProducts= 'product-with-category';
const String kSearchProduct= 'search-product';
const String kCheckout= 'orders/check-out';
const String kCheckCoupon= 'orders/check-coupon';
const String kPlaceOrder= 'orders/place';
const String kPInProgressOrder= 'orders/in-progress';
const String kShippingOrder= 'orders/shipping';
const String kDeliveredOrder= 'orders/delivered';
const String kCancelledOrder= 'orders/canceled';
const String kOrderDetails= 'orders';
const String kCancelOrderItem= 'orders/cancel';
const String kReviewOrderItem= 'orders/review-product';


//Static Headers
 Map<String, String> apiHeaders = {
  "Content-Type": "application/json",
  "Accept": "application/json, text/plain, */*",
  "X-Requested-With": "XMLHttpRequest",
};


Future<void> launchUrlFu({required String url}) async {
 if (!await launchUrl(Uri.parse(url),mode: LaunchMode.externalApplication)) {
  throw Exception('Could not launch $url');
 }
}