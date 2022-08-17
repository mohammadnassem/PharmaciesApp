import 'package:get/get.dart';
import 'package:pharmacies/model/pharmacy.dart';

class HomeController extends GetxController {
  List<Map> pharmacies = [
    {
      'id': 1,
      'name': 'Rexall',
      'photo': 'assets/images/Rexall.png',
      'location': 'Beirut',
      'products': [
        {
          'id': 1,
          'name': 'Anti-migraine',
          'photo': 'assets/images/1.png',
          'count': 10
        },
        {
          'id': 2,
          'name': 'Anti-anaemic',
          'photo': 'assets/images/2.png',
          'count': 8
        },
        {
          'id': 3,
          'name': 'Viberzi ',
          'photo': 'assets/images/3.png',
          'count': 6
        }
      ]
    },
    {
      'id': 2,
      'name': 'Uniprix',
      'photo': 'assets/images/Uniprix.png',
      'location': 'Beirut',
      'products': [
        {
          'id': 1,
          'name': 'Anti-migraine',
          'photo': 'assets/images/3.png',
          'count': 10
        },
        {
          'id': 2,
          'name': 'Carvedilol',
          'photo': 'assets/images/5.png',
          'count': 8
        },
        {
          'id': 3,
          'name': 'Diltiazem ',
          'photo': 'assets/images/4.png',
          'count': 6
        }
      ]
    },
    {
      'id': 3,
      'name': 'Walmart',
      'photo': 'assets/images/Walmart.png',
      'location': 'Damascus',
      'products': [
        {
          'id': 1,
          'name': 'Anti-Metoclopramide',
          'photo': 'assets/images/1.png',
          'count': 10
        },
        {
          'id': 1,
          'name': 'Rybelsus',
          'photo': 'assets/images/3.png',
          'count': 8
        },
        {
          'id': 1,
          'name': 'Diltiazem ',
          'photo': 'assets/images/4.png',
          'count': 6
        }
      ]
    },
    {
      'id': 4,
      'name': 'Familiprix',
      'photo': 'assets/images/Familiprix.png',
      'location': 'chtaura',
      'products': [
        {
          'id': 1,
          'name': 'Hydralazine',
          'photo': 'assets/images/2.png',
          'count': 4
        }
      ]
    },
    {
      'id': 5,
      'name': 'Lawtons',
      'photo': 'assets/images/Lawtons.png',
      'location': 'al hamraa',
      'products': [
        {
          'id': 1,
          'name': 'Methyldopa',
          'photo': 'assets/images/5.png',
          'count': 4
        }
      ]
    }
  ];

  Pharmacy? _selectedPharmacy;
  List<Pharmacy> _pharmacyListModel = [];
  List<Product> _productListModel = [];
  Pharmacy? get selectedPharmacy => _selectedPharmacy;
  List<Pharmacy> get pharmacyListModel => _pharmacyListModel;
  List<Product> get productListModel => _productListModel;

  @override
  void onInit() async {
    getAllPharmacy();
    super.onInit();
  }

  setSelectedPharmacye(Pharmacy pharmacyModel) {
    _selectedPharmacy = pharmacyModel;
    _productListModel = pharmacyModel.products!;
    update();
  }

  getAllPharmacy() {
    _pharmacyListModel =
        pharmacies.map((e) => Pharmacy.fromJson(e.cast())).toList();
    if (_pharmacyListModel.isNotEmpty) {
      setSelectedPharmacye(_pharmacyListModel[0]);
    }
  }
}
