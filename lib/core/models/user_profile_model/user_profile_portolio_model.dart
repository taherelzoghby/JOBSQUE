import 'package:jobsque/core/models/user_profile_model/portfolio.dart';
import 'package:jobsque/core/models/user_profile_model/profile.dart';

class UserProfilePortfolioModel {
  List<PortfolioModel>? portfolio;
  Profile? profile;

  UserProfilePortfolioModel({this.portfolio, this.profile});

  UserProfilePortfolioModel.fromJson(Map<String, dynamic> json) {
    if (json['portfolio'] != null) {
      portfolio = <PortfolioModel>[];
      json['portfolio'].forEach((v) {
        portfolio!.add(PortfolioModel.fromJson(v));
      });
    }
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }
}
