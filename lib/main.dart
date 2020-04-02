import 'package:ea_seed/screens/all_crop_experts.dart';
import 'package:ea_seed/screens/all_farming_tips.dart';
import 'package:ea_seed/screens/all_recipes.dart';
import 'package:ea_seed/screens/buyer_registration.dart';
import 'package:ea_seed/screens/buyers_screen.dart';
import 'package:ea_seed/screens/conversation_details.dart';
import 'package:ea_seed/screens/conversations.dart';
import 'package:ea_seed/screens/expert_registration.dart';
import 'package:ea_seed/screens/farming_tips.dart';
import 'package:ea_seed/screens/farming_tips_details.dart';
import 'package:ea_seed/screens/fetch_expert_screen.dart';
import 'package:ea_seed/screens/find_buyers.dart';
import 'package:ea_seed/screens/find_buyers_screen.dart';
import 'package:ea_seed/screens/find_expert_screen.dart';
import 'package:ea_seed/screens/home.dart';
import 'package:ea_seed/screens/login.dart';
import 'package:ea_seed/screens/market.dart';
import 'package:ea_seed/screens/market_trend_screen.dart';
import 'package:ea_seed/screens/news.dart';
import 'package:ea_seed/screens/news_details.dart';
import 'package:ea_seed/screens/preferred_buyer_crops_selection.dart';
import 'package:ea_seed/screens/preferred_crop_selection.dart';
import 'package:ea_seed/screens/products.dart';
import 'package:ea_seed/screens/recipe.dart';
import 'package:ea_seed/screens/recipe_details.dart';
import 'package:ea_seed/screens/register_screen.dart';
import 'package:ea_seed/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
//        '/': (context) => MyApp(),
        '/': (context) => Welcome(),
        '/login': (context) => Login(),
        '/register': (context) => Register(),
        '/home': (context) => Home(),
        '/news': (context) => NewsScreen(),
        '/market': (context) => MarketScreen(),
        '/conversations': (context) => ConversationScreen(),
        '/products': (context) => Products(),
        '/recipe': (context) => RecipeScreen(),
        '/farmingtips': (context) => FarmingTips(),
        '/newsDetails': (context) => NewsDetailsScreen(),
        '/allFramingTips': (context) => AllFarmingTipsScreen(),
        '/farmingTipsDetails': (context) => FarmingTipDetailsScreen(),
        '/allRecipes': (context) => AllRecipeScreen(),
        '/recipeDetails': (context) => RecipeDetailsScreen(),
        '/conversationDetails': (context) => ConversationDetailsScreen(),
        '/buyers': (context) => BuyersScreen(),
        '/buyer_registration': (context) => BuyerRegisterScreen(),
        '/find_buyers': (context) => AllBuyersCropsScreen(),
        '/cropBuyerDetails': (context) => AllSeedBuyersScreen(),
        '/marketTrendScreen': (context) => MarketTrendScreen(),
        '/find_expert': (context) => FindExpertScreen(),
        '/fetch_expert_crops': (context) => AllExpertCropsScreen(),
        '/cropExpertDetails': (context) => AllSeedExpertsScreen(),
        '/expert_registration': (context) => ExpertRegisterScreen(),
        '/fetch_prefered_crops': (context) => PreferredCropsScreen(),
        '/fetch_buyer_preferred_crops': (context) => PreferredBuyerCropsScreen()
      },
    ));
