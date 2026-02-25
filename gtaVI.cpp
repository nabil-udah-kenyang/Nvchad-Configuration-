#include <iostream>
using namespace std ;

class scriptgta{
  public:
  string kesulitan;
  string w;
  string A;
  string S;
  string D;

  string graphic;
  string resolution;

  void welcome(){
    cout<<"================= Welcome To GTA VI ====================\n";
  }

};

int main () {
  
   scriptgta script_gta;


  script_gta.kesulitan="Normal";
  script_gta.w ="Maju";
  script_gta.A ="kiri";
  script_gta.S ="Mundur";
  script_gta.D ="Kanan";

  script_gta.graphic ="Lumayan";
  script_gta.resolution ="Tajam";

  script_gta.welcome();
}
