import ballerina/data.xmldata;

public type Meta record {|
    string channel;
    string priorityTag?;
|};

public type ItemsItem record {|
    string sku;
    int qty;
    decimal price;
|};

public type Items ItemsItem[];

public type Requested record {|
    boolean giftWrap;
    string? note;
|};

public type OrdersItem record {|
    string orderId;
    string customerId;
    string currency;
    Meta meta;
    Items items;
    Requested requested;
|};

public type Orders OrdersItem[];

public type OrderDetails record {|
    Orders orders;
|};

public type CustomersItem record {|
    string id;
    string name;
    string tier;
    string email;
|};

public type Customers CustomersItem[];

public type CustomerDetails record {|
    Customers customers;
|};

public type Platinum record {|
    boolean priority;
    int discountPct;
|};

public type Gold record {|
    boolean priority;
    int discountPct;
|};

public type Silver record {|
    boolean priority;
    int discountPct;
|};

public type Standard record {|
    boolean priority;
    int discountPct;
|};

public type Tiers record {|
    Platinum platinum;
    Gold gold;
    Silver silver;
    Standard standard;
|};

public type TierDetails record {|
    Tiers tiers;
|};

type Line record {
    string Sku;
    int Qty;
    decimal UnitPrice;
};

type Lines record {
    Line[] Line;
};

type Comment record {
    @xmldata:Attribute
    string nil;
};

type CreateOrder record {
    string OrderId;
    string CustomerName;
    boolean Priority;
    Lines Lines;
    string Currency;
    boolean GiftWrap;
    Comment|string Comment;
    string Channel;
    int DiscountPct;
};

type CreateOrders record {
    CreateOrder[] CreateOrder;
};

type MyType string[10];
