import ballerina/http;
import ballerina/uuid;

type Item record {
    string id;
    string name;
    int price;
};

type ItemDTO record {|
    string name;
    int price;
|};

Item[] items = [
    {id: uuid:createType1AsString(), name: "apple", price: 10},
    {id: uuid:createType1AsString(), name: "orange", price: 20},
    {id: uuid:createType1AsString(), name: "banana", price: 30}
];

service /api on new http:Listener(9090) {

    resource function get items() returns Item[]|error {
        return items;
    }

    resource function post items(ItemDTO item) returns Item|error {
        Item newItem = {id: uuid:createType1AsString(), name: item.name, price: item.price};
        items.push(newItem);
        return newItem;
    }
}
