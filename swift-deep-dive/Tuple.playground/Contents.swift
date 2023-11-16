import  Foundation

let tuple1 = ("Thiago1", 31)

let tuple2 = (name: "Thiago2", age: 32)

let tuple3: (name: String, age: Int) = (name: "Thiago3", age: 33)

print("\(tuple1.0) is \(tuple1.1) years old.")
print("\(tuple2.name) is \(tuple2.age) years old.")
print("\(tuple3.name) is \(tuple3.age) years old.")
