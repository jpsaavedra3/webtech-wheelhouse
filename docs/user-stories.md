# User stories

The **customer** does not appear as an actor below. The shop phones them and waits for a yes; the
counter records the answer.

## Counter

**US-01**

> As a **counter clerk**,
> I want to register an arriving bike under its owner's name and phone,
> so that the paper tag on the handlebars stops being the only record we have.

**US-02**

> As a **counter clerk**,
> I want to attach photos of the bike taken when it arrived,
> so that nobody argues later about who made the scratch.

**US-03** *(from the split of US-BIG)*

> As a **counter clerk**,
> I want to find a bike by its owner's name or its serial number and see the state it is in,
> so that I can say whether it is ready without walking to the back to ask.

**US-04**

> As a **counter clerk**,
> I want to record that the customer approved or declined the quoted price,
> so that a mechanic knows whether they are allowed to touch the bike.

**US-05**

> As a **counter clerk**,
> I want to mark a bike as collected by its owner,
> so that it stops appearing among the bikes we are still holding.

## Mechanic

**US-06**

> As a **mechanic**,
> I want to write the diagnosis as a paragraph or a list rather than four words,
> so that whoever reads it afterwards understands what I found.

**US-07** *(from the split of US-BIG)*

> As a **mechanic**,
> I want to see the repairs waiting on me in one place,
> so that I can stop keeping my own notebook that nobody else can read.

**US-08**

> As a **mechanic**,
> I want to add the services this bike needs from the wall list and see what the total comes to,
> so that the counter can tell the customer what it will cost before we start.

**US-09**

> As a **mechanic**,
> I want to mark a service on a repair as done,
> so that the counter can see the bike is progressing without asking me.

**US-10**

> As a **mechanic**,
> I want to see every repair this bike has had here, whoever owned it at the time,
> so that I do not replace a fork that was already replaced.

## Owner

**US-11** *(from the split of US-BIG)*

> As the **shop owner**,
> I want to see the repairs that are past the day we promised and not yet collected,
> so that I hear about a late bike from the screen instead of from an angry phone call.

**US-12**

> As the **shop owner**,
> I want to change the price of a service on the wall list,
> so that the new price applies from now on without last year's invoices changing.

**US-13**

> As the **shop owner**,
> I want to charge less than the list price for a particular service on a particular repair,
> so that a regular customer, or work that turned out easier than expected, is reflected in what
> we actually charge.

## Visitor

**US-14**

> As a **visitor**,
> I want to read the shop's price list on the website,
> so that I do not have to phone the shop to find out what a tune-up costs.

## US-BIG — too big, split below

> As the **shop owner**,
> I want to see the state of everything in the workshop,
> so that I can answer any question about any bike without walking to the back.

"Everything" is at least three screens, nobody can say whether it is a day or a month, and no
state of the screen makes it true or false. It becomes three stories, each one usable on its own:

**US-BIG.1 → US-03**

> As a **counter clerk**,
> I want to find one bike and see the state it is in,
> so that I can answer the phone without leaving the counter.

**US-BIG.2 → US-11**

> As the **shop owner**,
> I want a list of the repairs that are past their promised day,
> so that I find out about a late bike before the customer does.

**US-BIG.3 → US-07**

> As a **mechanic**,
> I want to see the repairs that are waiting on me,
> so that I know which bike to pick up next.

## Acceptance criteria

### US-03 — find a bike and see its state

- Searching an owner's name returns every bike registered under that name, and searching a serial
  number returns at most the one bike carrying it
- Each result shows the bike model, the serial number, the state of its repair and the day it was
  promised
- A search that matches nothing shows a message saying no bike matches that name or serial,
  instead of an empty region of the screen
- A bike that has been collected is shown as collected, and is not presented as still in the shop

### US-04 — record the customer's answer

- The approve and decline actions are offered only on a repair that is waiting for an answer
- Approving a repair records who recorded it and on what date
- Declining a repair moves it to a state in which no service can be marked done
- A declined repair can still be marked as collected, because the customer comes to pick the bike
  up the way it arrived

### US-11 — repairs past the promised day

- A repair appears when the day promised is earlier than today and the bike has not been collected
- The list is ordered with the most overdue first
- Each row shows the bike, the owner's name and phone, and how many days late it is
- When nothing is late the screen says so, rather than showing an empty table
- A repair collected after its promised day does not appear, because it is no longer something the
  owner can act on

### US-10 — everything done to this bike

- The bike's page lists every repair on that bike, most recent first, including repairs registered
  under a previous owner
- Each past repair shows its date, the services performed and the diagnosis the mechanic wrote
- A bike with no previous repair shows a line saying this is its first visit, instead of an empty
  list
- The previous owner's name and phone are not shown, because the second owner is entitled to the
  bike's history and not to the person's details