

function mapRecordToInt3(CustomersItem customersItem) returns int {
    if (customersItem.tier == "Platinum") {
        return 20;
    } else if (customersItem.tier == "Gold") {
        return 15;
    } else if (customersItem.tier == "Silver") {
        return 10;
    } else if (customersItem.tier == "Standard") {
        return 5;
    } else {
        return 0;
    }
}

function mapRecordToBoolean3(CustomersItem customersItem) returns boolean {
    if (customersItem.tier == "Platinum") {
        return true;
    } else if (customersItem.tier == "Gold") {
        return true;
    } else if (customersItem.tier == "Silver") {
        return false;
    } else if (customersItem.tier == "Standard") {
        return false;
    } else {
        return false;
    }
}
