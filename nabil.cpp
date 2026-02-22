#include <iostream>
#include <string>
using namespace std;

void panggil_nama(string nama) { cout << "halo " << nama; }

void sapa_orang(string nama,int umur){
  cout<<"Halo "<<nama<<"berapa"<<umur"mu";
}

int main() {

  int angka = 3;
  string nama = "rizal";

 sapa_orang("nabil", 19); 

 panggil_nama("rizal");
  
}
