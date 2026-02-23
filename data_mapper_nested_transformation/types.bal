
type Header record {
    string BoL;
    string Vessel;
};

type Event record {
    string Code;
    string When;
};

type Events record {
    Event[] Event;
};

type Leg record {
    int PortSeq;
    string Port;
    Events Events;
};

type Legs record {
    Leg[] Leg;
};

type Shipment record {
    Header Header;
    Legs Legs;
};

public type Codes record {|
    string UN;
    string L;
    string A;
|};

public type MyType record {|
    Codes codes;
|};

type Port record {|
    string port;
    string country;
    string timezone;
|};

public type Events_01Item record {|
    string 'type;
    string port;
    string country;
    string ts;
    int portSeq;
|};

public type Events_01 Events_01Item[];

public type Schedule record {|
    string bol;
    string vessel;
    Events_01 events;
    string routeKey;
|};
