# Wheelhouse

A repair-tracking system for a bicycle repair shop.

Today the shop runs on paper: a tag tied to the handlebars with the customer's name and phone,
and three mechanics who each keep their own notes in their own notebook. When a customer phones
to ask whether their bike is ready, whoever answers has to walk to the back and find out.
Wheelhouse puts that on a screen.

It tracks a bike from the moment it arrives until its owner collects it: what bike it is and
which physical bike it is, what the mechanic found, which jobs from the wall list it needs and
what they cost, whether the customer approved the price, and whether the day we promised has
already passed. It keeps the history against the **bike**, not against the person, because bikes
get sold and the second owner still deserves to know that the fork was replaced.

The only thing the public sees is the price list.

## Who uses it

**Counter** takes bikes in, answers "is my bike ready", records the customer's answer to a quote, hands bikes back 

**Mechanic** writes the diagnosis, adds the jobs a bike needs, marks them done, reads what was done to this bike before

**Owner** watches the repairs that are past their promised day, keeps the wall list of prices, grants discounts 

**Visitor** reads the price list on the public site, and nothing else

The **customer** is not a user of the system. The shop phones them and waits for a yes; the
counter records the answer. 

## The documents

[`docs/user-stories.md`](docs/user-stories.md)  The roles, fifteen user stories, one story that was too big and its split, and acceptance criteria for four of them 

[`docs/domain-model.md`](docs/domain-model.md)  The relational model as a diagram and as DBML, the lifecycle of a repair, and every entity traced back to the story that requires it 

[`docs/decisions.md`](docs/decisions.md)  The three questions the owner's description does not answer, the assumption taken for each, and what would change in the model if the answer were the other one 

[`docs/wireframes.md`](docs/wireframes.md) Four low-fidelity screens, each labelled with the role looking at it, and the navigation graph between them 
