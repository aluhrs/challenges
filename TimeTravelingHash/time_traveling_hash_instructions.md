Time Traveling Hash

Create a hash that given a timestamp and a key returns a value.
If the timestamp does not exist, it will provide the value of the closest
and smaller timestamp for the key.
If the timestamp does not exist, and there is no smaller timestamp for the key,
it should return nil.

get(key, value)
put(key, value)

get(time, key)
put(time, key, value)

Examples:
hash.put(2.3, "key", 25)
hash.put(1.1, "key", 10)
hash.put(1.1, "foo", 300)
hash.put(1.5, "key", 5)
hash.put(2.3, "key", 4)
hash.put(5.0, "key", 20)

hash.get(1.3, "key") => 10
hash.get(2.0, "key") => 5
hash.get(5.5, "key") => 20

hash.get(0.5, "key") => nil, error
