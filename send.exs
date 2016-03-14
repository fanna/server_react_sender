defmodule Send do
  def random_status() do
    list = [true, false]
    Enum.random(list)
  end

  def random_rack() do
    list = [0, 1, 2, 3, 4, 5]
    Enum.random(list)
  end

  def random_server() do
    list = [0, 1, 2, 3, 4, 5]
    Enum.random(list)
  end

  def random_cpu() do
    list = [0, 1, 2, 3]
    Enum.random(list)
  end
end

data = %{:status => Send.random_status(), :rack => Send.random_rack(), :server => Send.random_server(), :cpu => Send.random_cpu()}
payload = :erlang.term_to_binary(data)
{:ok, connection} = AMQP.Connection.open
{:ok, channel} = AMQP.Channel.open(connection)
AMQP.Queue.declare(channel, "hello")
AMQP.Basic.publish(channel, "", "hello", payload)
IO.puts " [x] Sent everything"
AMQP.Connection.close(connection)
