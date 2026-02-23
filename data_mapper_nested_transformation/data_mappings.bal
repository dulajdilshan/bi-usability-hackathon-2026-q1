function transform(Shipment shipment, Port[] ports) returns Schedule => {
    bol: shipment.Header.BoL,
    vessel: shipment.Header.Vessel,
    events: from var LegItem in shipment.Legs.Leg
        from var EventItem in LegItem.Events.Event
        outer join var port in ports on LegItem.Port equals port?.port
        where port is Port
        select {'type: mapCode(EventItem.Code), port: port.port, country: port.country, portSeq: LegItem.PortSeq, ts: EventItem.When},
    routeKey: generateRouteKey(shipment.Legs.Leg)
};
