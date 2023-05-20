class BloodImages {
  String? bloodString;
  BloodImages(this.bloodString);
  String getBloodImages() {
    if (bloodString == 'A+') {
      return 'assets/A.png';
    } else if (bloodString == 'A-') {
      return 'assets/AA.png';
    } else if (bloodString == 'B+') {
      return 'assets/B.png';
    } else if (bloodString == 'B-') {
      return 'assets/BB.png';
    } else if (bloodString == 'O+') {
      return 'assets/O.png';
    } else if (bloodString == 'O-') {
      return 'assets/OO.png';
    } else if (bloodString == 'AB+') {
      return 'assets/AB.png';
    } else {
      return 'assets/A-B.png';
    }
  }
}
