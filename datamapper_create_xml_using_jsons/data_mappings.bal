function transform(CustomerDetails customerDetails, OrderDetails orderDetails, TierDetails tierDetails) returns CreateOrders => {

    CreateOrder: from var ordersItem in orderDetails.orders
        join var customersItem in customerDetails.customers on ordersItem.customerId equals customersItem.id
        select {
            OrderId: ordersItem.orderId,
            CustomerName: customersItem.name,
            Lines: {
                Line: from var itemsItem in ordersItem.items
                    select {Sku: itemsItem.sku, Qty: itemsItem.qty, UnitPrice: itemsItem.price}
            },
            Currency: ordersItem.currency,
            GiftWrap: ordersItem.requested.giftWrap,
            Channel: ordersItem.meta.channel,
            DiscountPct: mapRecordToInt3(customersItem),
            Priority: mapRecordToBoolean3(customersItem),
            Comment:  ordersItem.requested.note ?: "" 
        }
};

function mapRecordToInt2(CustomersItem customersItem) returns int => 0;

function mapRecordToBoolean1(CustomersItem customersItem) returns boolean => true;

function mapRecordToBoolean2(CustomersItem customersItem) returns boolean => true;
