import ballerina/io;
import ballerina/lang.value;

function mapCode(string code) returns string {
    do {
        json jsonResult = check io:fileReadJson("status.json");
        map<json> codesMap = check value:ensureType(jsonResult.codes);
        return codesMap.get(code).toString();
    } on fail {
        return "unknown";
    }

}

function generateRouteKey(Leg[] legs) returns string {
    string[] ports = from var leg in legs
        select leg.Port;
    return string:'join("-", ...ports);
}
