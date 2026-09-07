
puts "Clearing the database..."

RepairService.destroy_all
Repair.destroy_all
Bike.destroy_all
BikeModel.destroy_all
Customer.destroy_all
Service.destroy_all
User.destroy_all


puts "Staff..."

rodrigo = User.create!(name: "Rodrigo Alarcón",  role: "owner")
andres  = User.create!(name: "Andrés Lillo",     role: "mechanic")
nicolas = User.create!(name: "Nicolás Bustos",   role: "mechanic")
paulina = User.create!(name: "Paulina Herrera",  role: "mechanic")
josefa  = User.create!(name: "Josefa Alarcón",   role: "counter")


puts "Services..."

[
  { name: "Basic tune-up",              price: 25000, description: "Gears, brakes, tyres and a wipe-down." },
  { name: "Full service",               price: 65000, description: "Everything stripped, cleaned and rebuilt." },
  { name: "Wheel true",                 price: 12000, description: "One wheel, brought back to straight." },
  { name: "Wheel build",                price: 45000, description: "New wheel, laced and tensioned by hand." },
  { name: "Puncture repair",            price:  6000, description: "One tube, patched or replaced." },
  { name: "Tyre replacement",           price:  9000, description: "Fitting only. The tyre itself is charged apart." },
  { name: "Brake pad replacement",      price: 10000, description: "One wheel, pads fitted and aligned." },
  { name: "Hydraulic brake bleed",      price: 22000, description: "One brake, fluid replaced and bled." },
  { name: "Gear indexing",              price:  8000, description: "Derailleurs adjusted, cables tensioned." },
  { name: "Chain replacement",          price: 14000, description: "Fitting and sizing. The chain is charged apart." },
  { name: "Cassette replacement",       price: 16000, description: "Removed, cleaned and refitted." },
  { name: "Bottom bracket service",     price: 28000, description: "Removed, regreased or replaced." },
  { name: "Headset service",            price: 24000, description: "Stripped, regreased and retensioned." },
  { name: "Hub service",                price: 26000, description: "One hub, bearings cleaned and regreased." },
  { name: "Fork service",               price: 55000, description: "Suspension fork, seals and oil." },
  { name: "Bike box packing",           price: 35000, description: "Stripped and boxed for a flight." },
  { name: "Spoke replacement",          price:  7000, description: "One spoke, fitted and the wheel retrued." },
  { name: "Tubeless setup",             price: 18000, description: "Both wheels, valves and sealant included." },
  { name: "Derailleur hanger change",   price: 13000, description: "Bent or broken hanger replaced and aligned." },
  { name: "Handlebar tape",             price: 11000, description: "New tape, fitted. The tape is charged apart." },
  { name: "Pedal replacement",          price:  7500, description: "Old pedals off, new ones greased and fitted." },
  { name: "Bike wash",                  price:  8000, description: "Frame, drivetrain and wheels, degreased." }
].each do |attributes|
  Service.create!(attributes)
end


puts "Customers..."

marcela   = Customer.create!(name: "Marcela Ortiz",     phone: "+56 9 8123 4455")
tomas     = Customer.create!(name: "Tomás Vergara",     phone: "+56 9 7745 2091")
camila    = Customer.create!(name: "Camila Fuentes",    phone: "+56 9 6612 8834")
ignacio   = Customer.create!(name: "Ignacio Rojas",     phone: "+56 9 9033 1276")
paula     = Customer.create!(name: "Paula Cárdenas",    phone: "+56 9 5521 4408")
sebastian = Customer.create!(name: "Sebastián Muñoz",   phone: "+56 9 8890 5512")
andrea    = Customer.create!(name: "Andrea Salinas",    phone: "+56 9 7412 3390")
felipe    = Customer.create!(name: "Felipe Guzmán",     phone: "+56 9 6688 7124")
rocio     = Customer.create!(name: "Rocío Tapia",       phone: "+56 9 9271 6603")
matias    = Customer.create!(name: "Matías Contreras",  phone: "+56 9 5134 9987")
javiera   = Customer.create!(name: "Javiera Peña",      phone: "+56 9 8456 2210")


puts "Bikes..."

marlin      = BikeModel.create!(brand: "Trek",        name: "Marlin 5")
escape      = BikeModel.create!(brand: "Giant",       name: "Escape 3")
sirrus      = BikeModel.create!(brand: "Specialized", name: "Sirrus X")
aspect      = BikeModel.create!(brand: "Scott",       name: "Aspect 950")
quick       = BikeModel.create!(brand: "Cannondale",  name: "Quick 4")
kansas      = BikeModel.create!(brand: "Oxford",      name: "Kansas")
via_nirone  = BikeModel.create!(brand: "Bianchi",     name: "Via Nirone 7")


marlin_marcela = Bike.create!(bike_model_id: marlin.id,     customer_id: marcela.id,   serial_number: "WTU123456A",  colour: "Blue")
marlin_tomas   = Bike.create!(bike_model_id: marlin.id,     customer_id: tomas.id,     serial_number: "WTU987654B",  colour: "Blue")

escape_camila  = Bike.create!(bike_model_id: escape.id,     customer_id: camila.id,    serial_number: "GS4471902",   colour: "Black")
sirrus_ignacio = Bike.create!(bike_model_id: sirrus.id,     customer_id: ignacio.id,   serial_number: "SP20338811",  colour: "White")
aspect_paula   = Bike.create!(bike_model_id: aspect.id,     customer_id: paula.id,     serial_number: "SC7789012",   colour: "Red")
quick_seba     = Bike.create!(bike_model_id: quick.id,      customer_id: sebastian.id, serial_number: "CQ5540221",   colour: "Grey")
kansas_andrea  = Bike.create!(bike_model_id: kansas.id,     customer_id: andrea.id,    serial_number: "OX3312445",   colour: "Green")
bianchi_felipe = Bike.create!(bike_model_id: via_nirone.id, customer_id: felipe.id,    serial_number: "BI9087123",   colour: "Celeste")


marlin_marcela_2 = Bike.create!(bike_model_id: marlin.id,   customer_id: marcela.id,   serial_number: "WTU556677C",  colour: "Black")
sirrus_marcela   = Bike.create!(bike_model_id: sirrus.id,   customer_id: marcela.id,   serial_number: "SP44556677",  colour: "Black")

escape_rocio   = Bike.create!(bike_model_id: escape.id,     customer_id: rocio.id,     serial_number: "GS8812340",   colour: "Blue")
aspect_matias  = Bike.create!(bike_model_id: aspect.id,     customer_id: matias.id,    serial_number: "SC1122334",   colour: "Blue")

# This one arrived with the serial number filed off. The column allows NULL.
kansas_javiera = Bike.create!(bike_model_id: kansas.id,     customer_id: javiera.id,   serial_number: nil,           colour: "Black")


puts "Repairs..."

today = Date.current

# In and out the same afternoon. A flat tyre is never quoted.
r1 = Repair.create!(bike_id: escape_camila.id, received_by_id: josefa.id,
                    state: "collected",
                    received_at: today - 30, promised_on: today - 30,
                    collected_at: today - 30)
RepairService.create!(repair_id: r1.id, service_id: Service.find_by!(name: "Puncture repair").id,
                      mechanic_id: andres.id, charged_price: 6000, completed_at: today - 30)

# From before last January. The prices charged are last year's prices,
#     and they are lower than what the same jobs cost on the wall today.
r2 = Repair.create!(bike_id: sirrus_ignacio.id, received_by_id: josefa.id,
                    quote_answered_by_id: josefa.id,
                    state: "collected",
                    received_at: today - 400, promised_on: today - 398,
                    quote_answered_at: today - 399, collected_at: today - 397)
RepairService.create!(repair_id: r2.id, service_id: Service.find_by!(name: "Full service").id,
                      mechanic_id: rodrigo.id, charged_price: 58000, completed_at: today - 398)
RepairService.create!(repair_id: r2.id, service_id: Service.find_by!(name: "Wheel true").id,
                      mechanic_id: andres.id, charged_price: 10000, completed_at: today - 398)

# Promised five days ago and still on the rack. This is the overdue one.
r3 = Repair.create!(bike_id: aspect_paula.id, received_by_id: josefa.id,
                    quote_answered_by_id: josefa.id,
                    state: "ready",
                    received_at: today - 12, promised_on: today - 5,
                    quote_answered_at: today - 11)
RepairService.create!(repair_id: r3.id, service_id: Service.find_by!(name: "Hydraulic brake bleed").id,
                      mechanic_id: nicolas.id, charged_price: 22000, completed_at: today - 7)
RepairService.create!(repair_id: r3.id, service_id: Service.find_by!(name: "Gear indexing").id,
                      mechanic_id: nicolas.id, charged_price: 8000, completed_at: today - 7)

# On the stand right now.
r4 = Repair.create!(bike_id: quick_seba.id, received_by_id: josefa.id,
                    quote_answered_by_id: josefa.id,
                    state: "in_progress",
                    received_at: today - 2, promised_on: today + 2,
                    quote_answered_at: today - 1)
RepairService.create!(repair_id: r4.id, service_id: Service.find_by!(name: "Bottom bracket service").id,
                      mechanic_id: paulina.id, charged_price: 28000, completed_at: today)
RepairService.create!(repair_id: r4.id, service_id: Service.find_by!(name: "Chain replacement").id,
                      mechanic_id: paulina.id, charged_price: 14000)
RepairService.create!(repair_id: r4.id, service_id: Service.find_by!(name: "Cassette replacement").id,
                      mechanic_id: paulina.id, charged_price: 16000)

# Quoted yesterday. Nobody has answered yet, so there is no answer recorded.
r5 = Repair.create!(bike_id: kansas_andrea.id, received_by_id: josefa.id,
                    state: "quoted",
                    received_at: today - 1, promised_on: today + 3)
RepairService.create!(repair_id: r5.id, service_id: Service.find_by!(name: "Wheel build").id,
                      charged_price: 45000)
RepairService.create!(repair_id: r5.id, service_id: Service.find_by!(name: "Tubeless setup").id,
                      charged_price: 18000)

# The customer heard the price and said no.
r6 = Repair.create!(bike_id: bianchi_felipe.id, received_by_id: josefa.id,
                    quote_answered_by_id: josefa.id,
                    state: "declined",
                    received_at: today - 4, promised_on: today + 1,
                    quote_answered_at: today - 2)
RepairService.create!(repair_id: r6.id, service_id: Service.find_by!(name: "Fork service").id,
                      charged_price: 55000)

# Said yes yesterday. Nobody has picked it up off the rack yet.
r7 = Repair.create!(bike_id: escape_rocio.id, received_by_id: josefa.id,
                    quote_answered_by_id: rodrigo.id,
                    state: "approved",
                    received_at: today - 1, promised_on: today + 4,
                    quote_answered_at: today - 1)
RepairService.create!(repair_id: r7.id, service_id: Service.find_by!(name: "Basic tune-up").id,
                      charged_price: 25000)
RepairService.create!(repair_id: r7.id, service_id: Service.find_by!(name: "Brake pad replacement").id,
                      charged_price: 10000)

# Walked in this morning. Nothing has been looked at.
r8 = Repair.create!(bike_id: aspect_matias.id, received_by_id: josefa.id,
                    state: "received",
                    received_at: today, promised_on: today + 5)
RepairService.create!(repair_id: r8.id, service_id: Service.find_by!(name: "Basic tune-up").id,
                      charged_price: 25000)

# The same bike, twice, months apart.
r9 = Repair.create!(bike_id: marlin_marcela.id, received_by_id: josefa.id,
                    quote_answered_by_id: josefa.id,
                    state: "collected",
                    received_at: today - 200, promised_on: today - 197,
                    quote_answered_at: today - 199, collected_at: today - 196)
RepairService.create!(repair_id: r9.id, service_id: Service.find_by!(name: "Fork service").id,
                      mechanic_id: rodrigo.id, charged_price: 52000, completed_at: today - 197)
RepairService.create!(repair_id: r9.id, service_id: Service.find_by!(name: "Bike wash").id,
                      mechanic_id: andres.id, charged_price: 8000, completed_at: today - 197)

r10 = Repair.create!(bike_id: marlin_marcela.id, received_by_id: josefa.id,
                     quote_answered_by_id: josefa.id,
                     state: "in_progress",
                     received_at: today - 20, promised_on: today + 1,
                     quote_answered_at: today - 19)
RepairService.create!(repair_id: r10.id, service_id: Service.find_by!(name: "Headset service").id,
                      mechanic_id: andres.id, charged_price: 24000, completed_at: today - 18)
RepairService.create!(repair_id: r10.id, service_id: Service.find_by!(name: "Spoke replacement").id,
                      mechanic_id: andres.id, charged_price: 7000)

# The other blue Marlin, so that the two of them both have history.
r11 = Repair.create!(bike_id: marlin_tomas.id, received_by_id: josefa.id,
                     quote_answered_by_id: josefa.id,
                     state: "collected",
                     received_at: today - 60, promised_on: today - 58,
                     quote_answered_at: today - 59, collected_at: today - 58)
RepairService.create!(repair_id: r11.id, service_id: Service.find_by!(name: "Basic tune-up").id,
                      mechanic_id: nicolas.id, charged_price: 25000, completed_at: today - 58)
RepairService.create!(repair_id: r11.id, service_id: Service.find_by!(name: "Tyre replacement").id,
                      mechanic_id: nicolas.id, charged_price: 9000,  completed_at: today - 58)
RepairService.create!(repair_id: r11.id, service_id: Service.find_by!(name: "Pedal replacement").id,
                      mechanic_id: nicolas.id, charged_price: 7500,  completed_at: today - 58)

# Finished, promised for tomorrow. Not late.
r12 = Repair.create!(bike_id: marlin_marcela_2.id, received_by_id: josefa.id,
                     quote_answered_by_id: josefa.id,
                     state: "ready",
                     received_at: today - 3, promised_on: today + 1,
                     quote_answered_at: today - 2)
RepairService.create!(repair_id: r12.id, service_id: Service.find_by!(name: "Wheel true").id,
                      mechanic_id: paulina.id, charged_price: 12000, completed_at: today - 1)
RepairService.create!(repair_id: r12.id, service_id: Service.find_by!(name: "Handlebar tape").id,
                      mechanic_id: paulina.id, charged_price: 11000, completed_at: today - 1)

# Four jobs, the most a repair carries here. One of them was discounted
#      because Tomás has been coming for years.
r13 = Repair.create!(bike_id: sirrus_marcela.id, received_by_id: josefa.id,
                     quote_answered_by_id: rodrigo.id,
                     state: "collected",
                     received_at: today - 45, promised_on: today - 43,
                     quote_answered_at: today - 44, collected_at: today - 42)
RepairService.create!(repair_id: r13.id, service_id: Service.find_by!(name: "Full service").id,
                      mechanic_id: rodrigo.id, charged_price: 60000, completed_at: today - 43)
RepairService.create!(repair_id: r13.id, service_id: Service.find_by!(name: "Hub service").id,
                      mechanic_id: rodrigo.id, charged_price: 26000, completed_at: today - 43)
RepairService.create!(repair_id: r13.id, service_id: Service.find_by!(name: "Cassette replacement").id,
                      mechanic_id: andres.id,  charged_price: 16000, completed_at: today - 43)
RepairService.create!(repair_id: r13.id, service_id: Service.find_by!(name: "Bike wash").id,
                      mechanic_id: andres.id,  charged_price: 5000,  completed_at: today - 43)

# Quoted this morning, waiting on a phone call.
r14 = Repair.create!(bike_id: kansas_javiera.id, received_by_id: josefa.id,
                     state: "quoted",
                     received_at: today - 1, promised_on: today + 6)
RepairService.create!(repair_id: r14.id, service_id: Service.find_by!(name: "Derailleur hanger change").id,
                      charged_price: 13000)
RepairService.create!(repair_id: r14.id, service_id: Service.find_by!(name: "Gear indexing").id,
                      charged_price: 8000)
RepairService.create!(repair_id: r14.id, service_id: Service.find_by!(name: "Bike wash").id,
                      charged_price: 8000)

# Camila's Giant, back again. Just arrived.
r15 = Repair.create!(bike_id: escape_camila.id, received_by_id: josefa.id,
                     state: "received",
                     received_at: today, promised_on: today + 7)
RepairService.create!(repair_id: r15.id, service_id: Service.find_by!(name: "Puncture repair").id,
                      charged_price: 6000)

puts "Done."
puts "  #{User.count} staff"
puts "  #{Service.count} services"
puts "  #{Customer.count} customers"
puts "  #{Bike.count} bikes"
puts "  #{Repair.count} repairs"
puts "  #{RepairService.count} lines on those repairs"