class PagesController < ApplicationController
  def home
  end

  def services
    @services = [
      { name: "Basic tune-up",          price: 25000, description: "Gears, brakes, tyres and a wipe-down." },
      { name: "Full service",           price: 65000, description: "Everything stripped, cleaned and rebuilt." },
      { name: "Wheel true",             price: 12000, description: "One wheel, brought back to straight." },
      { name: "Wheel build",            price: 45000, description: "New wheel, laced and tensioned by hand." },
      { name: "Puncture repair",        price:  6000, description: "One tube, patched or replaced." },
      { name: "Tyre replacement",       price:  9000, description: "Fitting only. The tyre itself is charged apart." },
      { name: "Brake pad replacement",  price: 10000, description: "One wheel, pads fitted and aligned." },
      { name: "Hydraulic brake bleed",  price: 22000, description: "One brake, fluid replaced and bled." },
      { name: "Gear indexing",          price:  8000, description: "Derailleurs adjusted, cables tensioned." },
      { name: "Chain replacement",      price: 14000, description: "Fitting and sizing. The chain is charged apart." },
      { name: "Cassette replacement",   price: 16000, description: "Removed, cleaned and refitted." },
      { name: "Bottom bracket service", price: 28000, description: "Removed, regreased or replaced." },
      { name: "Headset service",        price: 24000, description: "Stripped, regreased and retensioned." },
      { name: "Hub service",            price: 26000, description: "One hub, bearings cleaned and regreased." },
      { name: "Fork service",           price: 55000, description: "Suspension fork, seals and oil." },
      { name: "Bike box packing",       price: 35000, description: "Stripped and boxed for a flight." }
    ]
  end

  def visiting
  end

  def about
  end
end