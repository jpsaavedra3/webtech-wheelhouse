# Permissions

Who may do what in Wheelhouse. Each table is what one policy in `app/policies/` does. A visitor
without an account is sent to sign in, except for the list and the page of the services.

## Services — `ServicePolicy`

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| List (`index`) | Yes | Yes | Yes |
| Page (`show`) | Yes | Yes | Yes |
| New and create | Yes | No | No |
| Edit and update | Yes | No | No |
| Delete | Yes | No | No |

The list and the page are also open to visitors without an account.

## Staff — `StaffMemberPolicy`

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| List (`index`) | Yes | Yes | Yes |
| Page (`show`) | Yes | Yes | Yes |
| New and create | Yes | No | No |
| Edit and update | Yes | No | No |
| Delete | Yes | No | No |

## Customers — `CustomerPolicy`

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| List (`index`) | Yes | Yes | No |
| Page (`show`) | Yes | Yes | No |
| New and create | Yes | Yes | No |
| Edit and update | Yes | Yes | No |
| Delete | Yes | No | No |

## Bikes — `BikePolicy`

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| List (`index`) | Yes | Yes | No |
| Page (`show`) | Yes | Yes | No |
| New and create | Yes | Yes | No |
| Edit and update | Yes | Yes | No |
| Delete | Yes | No | No |

## Repairs — `RepairPolicy`

A mechanic's **own** repairs are the ones with a line assigned to the member of the staff joined to
their account. A mechanic account with no member of the staff has none. A repair is **handed back**
when its state is `collected`.

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| List (`index`) | Yes, every repair | Yes, every repair | Yes, only their own |
| Page (`show`) | Every repair | Every repair | Only their own |
| New and create (take a bike in) | Yes | Yes | No |
| Edit and update | Every repair | Every repair not handed back | Their own, not handed back |
| Remove an intake photo | Every repair | Every repair not handed back | Their own, not handed back |
| Delete | Yes | No | No |
| Fields they write | All the fields of the form | All the fields of the form | State, diagnosis and intake photos |

The account that took the repair in is never a field: it is read from the session.

## Home, visiting and about — `PagePolicy`

| Action | Owner | Counter | Mechanic |
|---|---|---|---|
| Home, visiting, about | Yes | Yes | Yes |
