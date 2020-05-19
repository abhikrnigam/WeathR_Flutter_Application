import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
class WeatherConditions {

  Icon getWeatherIcon(int condition) {
    if (condition < 300) {
      return Icon(
        FontAwesomeIcons.cloudShowersHeavy,
        color: Colors.white,
        size: 35.0,
      );
    } else if (condition < 400) {
      return Icon(
        FontAwesomeIcons.cloudRain,
        color: Colors.white,
        size: 35.0,
      );
    } else if (condition < 600) {
      return Icon(
        FontAwesomeIcons.umbrella,
        color: Colors.white,
        size: 35.0,
      );
    } else if (condition < 700) {
      return Icon(
        FontAwesomeIcons.snowflake,
        color: Colors.white,
        size: 35.0,
      );
    } else if (condition < 800) {
      return Icon(
        FontAwesomeIcons.smog,
        color: Colors.white,
        size: 35.0,
      );
    } else if (condition == 800) {
      return Icon(
        FontAwesomeIcons.sun,
        color: Colors.white,
        size: 35.0,
      );
    } else if (condition <= 804) {
      return Icon(
        FontAwesomeIcons.cloud,
        color: Colors.white,
        size: 35.0,
      );
    } else {
      return Icon(
        FontAwesomeIcons.meh,
        color: Colors.white,
        size: 35.0,
      );
    }
  }

  DecorationImage getWeatherImage(int condition) {
    if (condition < 300) {
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage('images/MajorScreenRain.jpg'),
      );
    } else if (condition < 400) {
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage('images/MajorScreenRain.jpg'),
      );
    } else if (condition < 600) {
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage('images/MajorScreenUmbrella.jpg'),
      );
    } else if (condition < 700) {
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage('images/MajorScreenSnow.jpg'),
      );
    } else if (condition < 800) {
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(1), BlendMode.dstATop),
        image: AssetImage('images/MajorScreenHaze2.jpg'),
      );
    } else if (condition == 800) {
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage('images/MajorScreenSun.jpg'),
      );
    } else if (condition <= 804) {
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage('images/MajorScreenClouds.jpg'),
      );
    } else {
      return DecorationImage(
        fit: BoxFit.cover,
        colorFilter: ColorFilter.mode(
            Colors.white.withOpacity(0.8), BlendMode.dstATop),
        image: AssetImage('images/MajorScreenTrees.jpg'),
      );
    }
  }
}