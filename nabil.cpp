#include <iostream>
#include <string>
using namespace std;

void panggil_nama(string nama) { cout << "halo " << nama; }

int main() {

  int angka = 3;
  string nama = "rizal";

  panggil_nama(nama);
  cout << endl;
  cout << nama;
}
