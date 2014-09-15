#include "http-server/HttpRequest.h"
#include "http-server/HttpResponse.h"
#include "http-server/slre.h"
#include "application.h"

class Configuration : public HttpResponse {
protected:
    const String header = "<html><head><title>OpenSoundModule</title></head><body>OpenSoundModule" \
                          "<script> function togglePin(e) { e.value = (e.value == 'Off') ? 'On' : 'Off'; } </script>";

    Stream& printBody(Stream& aStream) const {
        aStream.print(header);
        aStream.print("<ul>Digital<ul><li>Inputs</li><ul>");
        for (int i = 0; i < 8; ++i) {
            String pinLabel = "D" + String(i);
            String pinSetting = (digitalRead(i) == HIGH) ? "On" : "Off";
            aStream.print("<li>" + pinLabel + "<input type='button' id='" +
                pinLabel + "' value='" + pinSetting + "' onclick='togglePin(this)'/></li>");
        }
        aStream.print("</ul></ul></ul></body></html>");

        return aStream;
    }
};

class WebServer : public TCPServer {
public:
    WebServer() : TCPServer(80) {}

    WebServer(const unsigned aPort) : TCPServer(aPort) {}

    void loop() {
        // Read httprequest for any connected client
        if (TCPClient client = available()) {
            Serial.println("Client request:");
            HttpRequest hr;
            while (int numBytes = client.available()) {
                for (int i = 0; i < numBytes; ++i) {
                    const char buf = client.read();
                    hr.parse(buf);    
                }
            }
            Serial.println(hr.URL());
            // Display default configuration page
            if (slre_match("^/(|index.htm)$", hr.URL(), strlen(hr.URL()), NULL, 0) >= 0) {
                client << config;
            }
        }   
    };
    
    const Configuration config;
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
