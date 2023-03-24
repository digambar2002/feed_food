// Author: Prachi Nathjogi
// Author: Digambar Chaudhari

class FeedFoodStrings {
  // Network

  static final url = "https://feed-n-joy.000webhostapp.com/";
  // static const url = "http://10.0.2.2/feedfood/";
  // static const url = "http://192.168.182.152/feedfood/";

  static final register_url_volunteer = url + "authentication/register.php";

  static final register_url_ngo = url + "authentication/register_ngo.php";

  static final register_vaildate_url =
      url + "authentication/user_email_check.php";

  static final login_url = url + "authentication/login.php";

  static final forgot_pass_url = url + "authentication/forgotpass.php";

  static final volunteer_post_url = url + "volunteer/request.php";

  static final volunteer_history_url = url + "volunteer/history.php";
  static final volunteer_profile_url = url + "volunteer/profile.php";
  static final volunteer_update_profile_url =
      url + "volunteer/update_profile.php";

  static final volunteer_stat_profile_url = url + "volunteer/stat.php";

  // NGO Urls
  static final ngo_food_request_url = url + "ngo/food_request.php";
  static final ngo_food_pending_url = url + "ngo/food_pending.php";
  static final ngo_food_complete_url = url + "ngo/food_complete.php";
  static final ngo_food_details_url = url + "ngo/food_details.php";
  static final ngo_stat_url = url + "ngo/stat.php";
  static final ngo_update_food_url = url + "ngo/update.php";
  static final ngo_update_complete_food_url = url + "ngo/update_complete.php";
  static final ngo_profile_url = url + "ngo/profile.php";

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
