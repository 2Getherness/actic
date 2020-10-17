import 'dart:convert';
 


// Här är modelan för api anrop

Qrcode qrcodeFromJson(String str) => Qrcode.fromJson(json.decode(str));

String qrcodeToJson(Qrcode data) => json.encode(data.toJson());
 
 class Qrcode {
    Qrcode({
        this.qrcodeString,
    });

    String qrcodeString;

    factory Qrcode.fromJson(Map<String, dynamic> json) => Qrcode(
        qrcodeString: json["return"],
    );

    Map<String, dynamic> toJson() => {
        "return": qrcodeString,
    };
} 
