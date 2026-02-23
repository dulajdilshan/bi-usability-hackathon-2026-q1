public type Utm record {|
    string src;
    string campaign;
|};

public type Attrs record {|
    string channel;
    Utm utm?;
|};

public type ItemsItem record {|
    string sku;
    int qty;
    decimal price;
|};

public type Items ItemsItem[];

public type Discounts record {|
    map<decimal> perSku;
    int orderPct;
|};

public type OrdersItem record {|
    string orderId;
    Attrs attrs;
    Items items;
    Discounts discounts;
|};

public type Orders OrdersItem[];

public type OrderData record {|
    Orders orders;
|};

public type CsvOrderLineItem record {|
    string order_id;
    string sku;
    int qty;
    decimal unit_price;
    string channel;
    string utm_source?;
    decimal line_subtotal;
    decimal per_sku_disc;
    int order_pct_disc;
    decimal line_total;
|};

public type OrderSummary record {|
    string order_id;
    string channel;
    string utm_source?;
    int items_count;
    decimal subtotal;
    decimal total_discount;
    decimal total_after_discount;
|};

