#status = File.read "status.json"

list = ~s([
  {id: 1, cpus:[
    {id: 1, active: true},
    {id: 2, active: false},
    {id: 3, active: false},
    {id: 4, active: false}]
  },
  {id: 2, cpus:[
    {id: 1, active: true},
    {id: 2, active: false},
    {id: 3, active: true},
    {id: 4, active: false}]
  },
  {id: 3, cpus:[
    {id: 1, active: false},
    {id: 2, active: false},
    {id: 3, active: false},
    {id: 4, active: false}]
  },
  {id: 4, cpus:[
    {id: 1, active: false},
    {id: 2, active: false},
    {id: 3, active: false},
    {id: 4, active: false}]
  },
  {id: 5, cpus:[
    {id: 1, active: false},
    {id: 2, active: false},
    {id: 3, active: false},
    {id: 4, active: false}]
  },
  {id: 6, cpus:[
    {id: 1, active: false},
    {id: 2, active: false},
    {id: 3, active: false},
    {id: 4, active: false}]
  },
  {id: 7, cpus:[
    {id: 1, active: false},
    {id: 2, active: false},
    {id: 3, active: false},
    {id: 4, active: false}]
  },
  {id: 8, cpus:[
    {id: 1, active: false},
    {id: 2, active: false},
    {id: 3, active: false},
    {id: 4, active: false}]
  },
  {id: 9, cpus:[
    {id: 1, active: false},
    {id: 2, active: false},
    {id: 3, active: false},
    {id: 4, active: false}]
  },
  {id: 10, cpus:[
    {id: 1, active: false},
    {id: 2, active: false},
    {id: 3, active: false},
    {id: 4, active: false}]
  }
])

data = %{:list => list}
payload = :erlang.term_to_binary(data)

{:ok, connection} = AMQP.Connection.open "amqp://URXUg6J0:7HBdTaSietQgyQBvdiCMZpIrJIbQIF64@excited-nelthilta-31.bigwig.lshift.net:10286/ch4tOy6aLnX0"
{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "hello")
AMQP.Basic.publish(channel, "", "hello", payload)
IO.puts " [x] Sent everything"
AMQP.Connection.close(connection)

