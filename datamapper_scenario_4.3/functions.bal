function mapMapToDecimal1(map<decimal> perSku, string key) returns decimal {
    if perSku.hasKey(key) {
        return perSku.get(key);
    }
    return 0.0d;
}

function itemCount(Items items) returns int {
    int count = 0;
    foreach ItemsItem item in items {
        count = count + item.qty;
    }
    return count;
}


function calculateSubtotal(ItemsItem[] items) returns decimal {
    decimal total = 0.0;
    foreach var item in items {
        total += item.price * <decimal>item.qty;
    }
    return total;
}

function calculateTotalDiscount(ItemsItem[] items, Discounts discounts) returns decimal {
    decimal subtotal = 0.0;
    decimal skuDiscount = 0.0;
    foreach var item in items {
        decimal itemTotal = item.price * <decimal>item.qty;
        subtotal += itemTotal;
        decimal? perSkuDiscount = discounts.perSku[item.sku];
        if perSkuDiscount is decimal {
            skuDiscount += perSkuDiscount;
        }
    }
    decimal orderDiscount = subtotal * <decimal>discounts.orderPct / 100.0;
    return skuDiscount + orderDiscount;
}

function calculateTotalAfterDiscount(ItemsItem[] items, Discounts discounts) returns decimal {
    decimal subtotal = 0.0;
    decimal skuDiscount = 0.0;
    foreach var item in items {
        decimal itemTotal = item.price * <decimal>item.qty;
        subtotal += itemTotal;
        decimal? perSkuDiscount = discounts.perSku[item.sku];
        if perSkuDiscount is decimal {
            skuDiscount += perSkuDiscount;
        }
    }
    decimal orderDiscount = subtotal * <decimal>discounts.orderPct / 100.0;
    decimal totalDiscount = skuDiscount + orderDiscount;
    return subtotal - totalDiscount;
}