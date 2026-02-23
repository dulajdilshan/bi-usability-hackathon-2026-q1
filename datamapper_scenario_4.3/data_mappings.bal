function transformOrderToCsvOrderList(OrdersItem orderItem) returns CsvOrderLineItem[] => from var itemsItem in orderItem.items
    select {order_id: orderItem.orderId, sku: itemsItem.sku, qty: itemsItem.qty, unit_price: itemsItem.price, channel: orderItem.attrs.channel, line_subtotal: itemsItem.price * itemsItem.qty, order_pct_disc: orderItem.discounts.orderPct, line_total: (itemsItem.price * itemsItem.qty - mapMapToDecimal1(orderItem.discounts.perSku, itemsItem.sku)) * (100 - orderItem.discounts.orderPct) / 100, per_sku_disc: mapMapToDecimal1(orderItem.discounts.perSku, key = itemsItem.sku), utm_source: orderItem.attrs?.utm?.src};

function transformOrdersToOrderSummary(OrdersItem orderItem) returns OrderSummary => {
    total_discount: calculateTotalDiscount(orderItem.items, orderItem.discounts),
    total_after_discount: calculateTotalAfterDiscount(orderItem.items, orderItem.discounts),
    items_count: itemCount(orderItem.items),
    subtotal: calculateSubtotal(orderItem.items),
    channel: orderItem.attrs.channel,
    order_id: orderItem.orderId,
    utm_source: orderItem.attrs?.utm?.src
};
