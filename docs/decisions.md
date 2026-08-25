# Decisions

Three questions the owner's description does not answer. Each one was chosen because the answer
changes the model, and each carries the assumption taken in order to keep working.

## 1. When you phone the customer, does the answer have to come back through the phone?

**The question.** *"We call the person, tell them what it will cost, and wait for them to say
yes."* The call is how the shop works today. But the owner also wants the wall list on the
website, so a customer is already looking at a screen. Should that customer be able to approve
the price there, or does the yes stay something the counter hears and writes down?

**The assumption.** The customer is not a user of Wheelhouse. The counter records the answer it
received on the phone, and the only public page is the price list — *"nothing else public. I do
not want people reading other people's repairs."* This is why no story below the counter has the
customer as an actor.

**If the answer is the other one.** The customer becomes an actor, and three things change.
`repairs.quote_answered_by_id` points at `users` today, meaning a member of staff; it would have
to point at whoever actually answered, so either it splits into two nullable columns or the
answer moves to a small entity of its own carrying who answered and how.

## 2. Does one mechanic take a bike, or do the three of you split the jobs on it?

**The question.** *"There are three of us in the workshop"*, and a bike *"usually needs two or
three"* services. The description never says whether the person who trues the wheel is the same
one who bleeds the brakes.

**The assumption.** Each service on a repair is performed by one mechanic, and different services
on the same repair can belong to different mechanics. `mechanic_id` therefore lives on
`repair_services`. It is the finer of the two readings, and it is the one that still works if the
shop turns out to do it the other way.

**If the answer is the other one.** If one mechanic owns the whole bike, `mechanic_id` moves from
`repair_services` up to `repairs`, and `repair_services` drops to four columns. US-07 — *"the
repairs waiting on me"* — becomes a query on `repairs` rather than a query through
`repair_services`, which is a simpler screen and a simpler permission rule in Lab 13. If instead
two mechanics can share a single service, `mechanic_id` stops being a column at all and becomes a
table between `users` and `repair_services`.

## 3. When a bike is sold, does the shop need to know who owned it when?

**The question.** *"People sell them, and the second owner deserves to know the fork was
replaced."* That says the history belongs to the bike. It does not say whether the shop needs to
reconstruct which owner was on the other end of a repair done three years ago.

**The assumption.** `bikes.customer_id` holds the current owner and nothing else. A repair is
attached to the bike, so selling the bike carries the whole history to the new owner without
touching a single repair. The previous owner's name is not shown on the bike's page — the second
owner is entitled to the bike's history, not to the person's details.

**If the answer is the other one.** If the shop needs to say who owned the bike at the time of a
past repair, `bikes.customer_id` cannot survive: a bike would have many owners over time, and the
current one is only the last row. It becomes a `bike_ownerships` table between `bikes` and
`customers` with a start and an end date, every "whose bike is this" question goes through it
instead of through a foreign key, and each repair needs to record the owner it was for — because
a repair from 2023 must not follow the ownership that changed in 2025.