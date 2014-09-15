#include "http-server/HttpRequest.h"
#include "http-server/HttpResponse.h"
#include "http-server/slre.h"
#include "application.h"

class Configuration : public HttpResponse {
protected:
//  const String header = "<html><head><title>OpenSoundModule</title></head><body>OpenSoundModule" \
//  "<script> function togglePin(e) { e.value = (e.value == 'Off') ? 'On' : 'Off'; } </script>";
  
  Stream& printBody(Stream& aStream) const {
    aStream.print("<html><head><title>OpenSoundModule</title></head><body>OpenSoundModule<script>"\
                  "function togglePin(e) { e.value = (e.value == 'Off') ? 'On' : 'Off'; } </script>"\
                  "<ul>Digital<ul><li>Inputs</li><ul>");
    
    for (int i = 0; i < 8; ++i) {
      String pinLabel = "D" + String(i);
      String pinSetting = (digitalRead(i) == HIGH) ? "On" : "Off";
      aStream.print("<li>" + pinLabel + "<input type='button' id='" + pinLabel + "' value='" + pinSetting + "' onclick='togglePin(this)'/></li>");
    }
    
    aStream.print("</ul></ul></ul></body></html>");
    
    return aStream;
  }
};

class WebServer : public TCPServer {
public:
  const Configuration config;
  
  WebServer() : TCPServer(80) {}
  
  WebServer(const unsigned aPort) : TCPServer(aPort) {}
  
  void loop() {
    Serial.println("Server loop");
    // Read httprequest for any connected client
    if (TCPClient client = available()) {
      Serial.println("Client request:");
      HttpRequest hr;
      while (int numBytes = client.available()) {
        Serial.println("Reading client request " + numBytes);
        for (int i = 0; i < numBytes; ++i) {
          const char buf = client.read();
          hr.parse(buf);
        }
      }
      // Display default configuration page
      if (slre_match("^/(|index.htm)$", hr.URL(), strlen(hr.URL()), NULL, 0) >= 0) {
        Serial.println("Show index");
        client << config;
      } else if ((slre_match("^/D0/(on|off)$", hr.URL(), strlen(hr.URL()), caps, 1) >= 0)) {
        pinMode(D0, OUTPUT);
        if (!strcmp(caps[0].ptr, "on")) {
          Serial.println("Turning D0 on");
          digitalWrite(D0, HIGH);
          client << config;
        } else if (!strcmp(caps[0].ptr, "off")) {
          Serial.println("Turning D0 off");
          digitalWrite(D0, LOW);
          client << config;
        } else {
          Serial.println("Show help");
        }
        
        client.flush();
        delay(100);
        client.stop();
        Serial.println("Client flushed");
      }
    }
  }
};

WebServer ws;

void setup() {
  pinMode(D0, OUTPUT);
  pinMode(D1, OUTPUT);
  pinMode(D2, OUTPUT);
  pinMode(D3, OUTPUT);
  pinMode(D4, OUTPUT);
  pinMode(D5, OUTPUT);
  
  // Set pins for testing web page
  digitalWrite(D0, HIGH);
  digitalWrite(D1, LOW);
  digitalWrite(D2, LOW);
  digitalWrite(D3, HIGH);
  digitalWrite(D4, HIGH);
  digitalWrite(D5, LOW);
  
  Serial.begin(9600);
  delay(1000);
  Serial.println(WiFi.localIP());
  ws.begin();
}

void loop() {
  ws.loop();
}
