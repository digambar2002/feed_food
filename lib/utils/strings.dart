// Author: Prachi Nathjogi
// Author: Digambar Chaudhari

class FeedFoodStrings {
  // Network

  // static const url = "https://feed-n-joy.000webhostapp.com";
  // static const url = "http://10.0.2.2/feednjoy/app/";
  static const url = "http://192.168.229.224/feednjoy/";

  static const register_url_volunteer =
      "${url}/app/authentication/register.php";

  static const register_url_ngo = "${url}/app/authentication/register_ngo.php";

  static const register_vaildate_url =
      "${url}/app/authentication/user_email_check.php";

  static const login_url = "${url}/app/authentication/login.php";

  static const forgot_pass_url = "${url}/app/authentication/forgotpass.php";

  static const volunteer_post_url = "${url}/app/volunteer/request.php";

  static const volunteer_history_url = "${url}/app/volunteer/history.php";
  static const volunteer_profile_url = "${url}/app/volunteer/profile.php";
  static const volunteer_update_profile_url =
      "${url}/app/volunteer/update_profile.php";

  static const volunteer_stat_profile_url = "${url}/app/volunteer/stat.php";

  // NGO Urls
  static const ngo_food_request_url = "${url}/app/ngo/food_request.php";
  static const ngo_food_pending_url = "${url}/app/ngo/food_pending.php";
  static const ngo_food_complete_url = "${url}/app/ngo/food_complete.php";
  static const ngo_food_details_url = "${url}/app/ngo/food_details.php";
  static const ngo_stat_url = "${url}/app/ngo/stat.php";
  static const ngo_update_food_url = "${url}/app/ngo/update.php";
  static const ngo_update_complete_food_url =
      "${url}/app/ngo/update_complete.php";
  static const ngo_profile_url = "${url}/app/ngo/profile.php";

  // Other NGO Information
  static const ngo_url1 = "https://www.akshayapatra.org/";
  static const ngo_url2 = "https://give.do/projects/project-nanhi-kali";

  static const ngo_url3 = "https://www.wateraid.org/";
  static const ngo_url4 = "https://sadsindia.org/";

  // walkthrough
  static const Whead1 = "No Food Waste!!";
  static const Whead2 = "We're in it together.";
  static const Whead3 = "Just one tap.";

  static const subtittle1 =
      "One third of all food produced is lost or wasted around 1.3 billion tonnes of food.";
  static const subtittle2 = "We can be the generation that ends hunger.";
  static const subtittle3 =
      "Make a difference in people's lives with just one tap.";

  // Pages
  static const BrandName = "Feed-n-Joy";
}
