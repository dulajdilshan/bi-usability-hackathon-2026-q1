import ballerina/data.xmldata;
import ballerina/io;
import ballerina/log;

public function main() returns error? {
    do {
        Port[] ports = check io:fileReadCsv("port.csv");
        xml xmlResult = check io:fileReadXml("shipment.xml");
        Shipment xmlOut = check xmldata:parseAsType(xmlResult);
        Schedule schedule = transform(xmlOut, ports);
        io:println(schedule);
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
