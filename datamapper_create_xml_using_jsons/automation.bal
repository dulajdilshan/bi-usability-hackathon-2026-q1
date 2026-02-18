import ballerina/data.jsondata;
import ballerina/data.xmldata;
import ballerina/io;
import ballerina/log;

public function main() returns error? {
    do {
        json orderJson = check io:fileReadJson(orderJsonPath);
        json customerDetailsJson = check io:fileReadJson(customDetailsJsonPath);
        json tierDetailsJson = check io:fileReadJson(tierDetails);
        OrderDetails orderType = check jsondata:parseAsType(orderJson);
        CustomerDetails customDetailsType = check jsondata:parseAsType(customerDetailsJson);
        TierDetails tierDetailsType = check jsondata:parseAsType(tierDetailsJson);
        map<json> var1;

        CreateOrders outputResult = transform(customDetailsType, orderType, tierDetailsType);
        xml xmlOutputResult = check xmldata:toXml(outputResult);
        check io:fileWriteXml(outputXmlPath, xmlOutputResult);
    } on fail error e {
        log:printError("Error occurred", 'error = e);
        return e;
    }
}
