class Conditions{

    String backgroundimage;
   String checkDayTime(DateTime a){
    if(a.hour>=6 && a.hour<=18){
      return backgroundimage='Sunny_day.jpg';
    }
    else
      return backgroundimage='Night_time.jpg';

  }

}