# The Wheelhouse API

## Routes

| Verb | Path | Token | Answers |
|---|---|---|---|
| `GET` | `/api/v1/services` | no | `200` |
| `GET` | `/api/v1/services/:id` | no | `200`, `404` |
| `POST` | `/api/v1/services` | yes | `201`, `400`, `401`, `422` |
| `GET` | `/api/v1/repairs` | yes | `200`, `400`, `401` |
| `GET` | `/api/v1/repairs/:id` | yes | `200`, `401`, `404` |

## Documents

### A service

```json
{
  "id": 1,
  "name": "Basic tune-up",
  "price": 25000,
  "repairs_count": 3
}
```

### A repair

```json
{
  "id": 3,
  "state": "ready",
  "received_on": "2026-10-07",
  "promised_on": "2026-10-14",
  "collected_on": null,
  "customer_answer": "approved",
  "overdue": true,
  "total": 30000,
  "customer": { "name": "Paula Cárdenas" },
  "bike": { "brand": "Scott", "model": "Aspect 950", "serial_number": "SC7789012" },
  "lines": [
    { "service": "Hydraulic brake bleed", "charged_price": 22000 },
    { "service": "Gear indexing", "charged_price": 8000 }
  ]
}
```

### A collection of repairs

```json
[
  {
    "id": 1,
    "state": "collected",
    "received_on": "2026-09-19",
    "promised_on": "2026-09-19",
    "collected_on": "2026-09-19",
    "customer_answer": null,
    "overdue": false,
    "total": 6000,
    "customer": { "name": "Camila Fuentes" },
    "bike": { "brand": "Giant", "model": "Escape 3", "serial_number": "GS4471902" },
    "lines": [
      { "service": "Puncture repair", "charged_price": 6000 }
    ]
  },
  {
    "id": 6,
    "state": "declined",
    "received_on": "2026-10-15",
    "promised_on": "2026-10-20",
    "collected_on": null,
    "customer_answer": "declined",
    "overdue": false,
    "total": 55000,
    "customer": { "name": "Felipe Guzmán" },
    "bike": { "brand": "Bianchi", "model": "Via Nirone 7", "serial_number": "BI9087123" },
    "lines": [
      { "service": "Fork service", "charged_price": 55000 }
    ]
  }
]
```

### An error

```json
{ "errors": ["Name is already on the list", "Price must be greater than 0"] }
```

## Decisions

**A price travels as a number, in whole pesos**, never as a string: `25000`, not `"25000.00"`.
The peso has no cents, and the pages already show prices without decimals. A whole number is exact
in JSON and in JavaScript, so the website formats it without converting anything. This holds for
`price`, `charged_price` and `total`.

**What the document of a repair leaves out, and why.** The accounting program needs what was
charged, to whom and for which bike. Everything else stays out:

- The customer's **phone**: accounting does not call anybody, and the owner does not want people's
  details going around.
- **Who did what in the shop** (who took the bike in, who recorded the answer, the mechanic of each
  line): that is how the workshop organises itself, not money.
- **When each line was finished**: the day the bike was handed back is enough to bill it.
- The **photos** and the **diagnosis**: they are for the mechanics, and they are heavy.
- Every **id of another table** (`bike_id`, `service_id`, `mechanic_id`): a program wants the bike
  and the service, not a number it would have to look up.