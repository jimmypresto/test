import Redis from 'ioredis';
const options = {
  redisOptions: {
    password: 'secret',
    tls: {
      rejectUnauthorized: false,
    }
  }, 
  dnsLookup: (address, callback) => callback(null, address),
};
const cluster = new Redis.Cluster([
  {
    port: 7001,
    host: "127.0.0.1",
  },
  {
    port: 7003,
    host: "127.0.0.1",
  },
], options);

cluster.set("foo", "bar");
cluster.get("foo", (err, res) => console.log(`res: ${res} err: ${err}`));
cluster.set("foo", "nai");
cluster.get("foo", (err, res) => console.log(`res: ${res} err: ${err}`));