class ElectronicDevice {
  String brand;
  bool isOn = false;

  ElectronicDevice(this.brand);

  void turnOn() {
    isOn = true;
    print('$brand is now ON.');
  }

  void turnOff() {
    isOn = false;
    print('$brand is now OFF.');
  }

  void displayInfo() {
    print('--- Device Info ---');
    print('Brand: $brand');
    print('Status: ${isOn ? "ON" : "OFF"}');
    print('');
  }
}

class Phone extends ElectronicDevice {
  String phoneNumber;

  Phone(String brand, this.phoneNumber) : super(brand);

  void makeCall(String number) {
    if (isOn) {
      print('Calling $number...');
    } else {
      print('Turn on the phone first.');
    }
  }

  @override
  void displayInfo() {
    print('--- Phone Info ---');
    super.displayInfo();
    print('Phone Number: $phoneNumber');
    print('');
  }
}

class Smartphone extends Phone {
  int storageGB;
  List<String> apps = [];

  Smartphone(String brand, String phoneNumber, this.storageGB)
    : super(brand, phoneNumber);

  void installApp(String appName) {
    apps.add(appName);
    print('$appName installed on $brand.');
  }

  @override
  void displayInfo() {
    print('--- Smartphone Info ---');
    print('Brand: $brand');
    print('Status: ${isOn ? "ON" : "OFF"}');
    print('Phone Number: $phoneNumber');
    print('Storage: ${storageGB}GB');
    print('Installed Apps: $apps');
    print('');
  }
}

void main() {
  Phone myPhone = Phone('Nokia', '01000000000');
  myPhone.turnOn();
  myPhone.makeCall('01111111111');
  myPhone.displayInfo();

  Smartphone mySmartphone = Smartphone('iPhone', '01099999999', 128);
  mySmartphone.turnOn();
  mySmartphone.makeCall('01288888888');
  mySmartphone.installApp('WhatsApp');
  mySmartphone.displayInfo();
}
