src :: FromNetFront(MACADDR)

filter :: IPFilter(allow udp && src port 60)

rewriter :: IPRewriter(pattern - - 10.0.0.1 1000 0 0)

dst :: ToNetFront(MACADDR)

src -> Print -> filter -> rewriter -> queue :: SimpleQueue ->  unqueue :: TimedUnqueue(10, 100) -> SimpleQueue -> dst
