const pointsJSON = {
  "lawn_size": {
    "small change ~100 sq ft reduction": 9,
    "medium change ~ 500 sq ft reduction": 43,
    "large change ~ 1,000 sq ft reduction": 86
  },
  "mower_type": {
    "yes": 0,
    "no": 0
  },
  "mower_switch": {
    "no": 0,
    "i will use a rake": 44,
    "i will use an electric mower": 22
  },
  "mowing_frequency": {
    "two  less": 2,
    "five less ": 5,
    "ten less": 10
  },
  "fertilizer": {
    "no": 0,
    "yes": 0
  },
  "fertilizer_applications": {
    "no": 0,
    "1 less": 10,
    "2 less": 20,
    "3 less ": 30,
    "4 less": 40,
    "5 less": 50
  },
  "leaf_cleanup": {
    "no": 0,
    "yes": 0
  },
  "leaf_cleanup_gas_blower_use": {
    "no": 0,
    "yes": 0
  },
  "weatherized": {
    "no": 0,
    "yes": 0
  },
  "energy_audit": {
    "no": 0,
    "yes": 100
  },
  "insulate_home": {
    "no": 0,
    "yes": 100
  },
  "install_programmable_thermostats": {
    "i already use programmable thermostats": 0,
    "no": 0,
    "yes": 43
  },
  "heating_system_type": {
    "oil furnace": 0,
    "forced hot air": 0,
    "baseboard water": 0,
    "wood fireplace": 0,
    "solar": 0,
    "other": 0
  },
  "upgrade_heating_system": {
    "no": 0,
    "yes": 100
  },
  "install_heat_pump": {
    "no": 0,
    "yes": 100
  },
  "heating_system_assessment": {
    "no": 0,
    "yes": 100
  },
  "water_heater_type": {
    "conventional storage tank ": 0,
    "tankless(on-demand) ": 0,
    "heat pump (hybrid) ": 0,
    "solar powered": 0,
    "condensing": 0
  },
  "hot_water_assessment": {
    "no": 0,
    "yes": 100
  },
  "replace_water_heater": {
    "no": 0,
    "yes": 100
  },
  "solar_panels": {
    "no": 0,
    "yes": 0
  },
  "solar_assessment": {
    "no": 0,
    "yes": 100
  },
  "install_solar_panels": {
    "no": 0,
    "yes": 100
  },
  "bulbs_incandescent": {
    "no": 0,
    "yes": 0
  },
  "bulbs_fluorescent_cfl": {
    "no": 0,
    "yes": 0
  },
  "bulbs_swap": {
    "no": 0,
    "yes": 100
  },
  "bulbs_replace_leds": {
    "some": 10,
    "half": 50,
    "all": 100,
    "0": 0
  },
  "appliances_replace_refrigerator": {
    "i already use a energy star product": 0,
    "no": 0,
    "yes": 0
  },
  "appliances_replace_washer": {
    "i already use a energy star product": 0,
    "no": 0,
    "yes": 0
  },
  "cold_water_wash_loads": {
    "no": 0,
    "once per week": 10,
    "twice per week": 20,
    "three times per week": 30
  },
  "line_or_rack_dry_loads": {
    "no": 0,
    "once per week": 86,
    "twice per week": 172,
    "three times per week": 258
  },
  "extra_refrigerator": {
    "no": 0,
    "yes": 0
  },
  "extra_refrigerator_age": {
    ">20 years old": 0,
    "15-20 years old": 0,
    "10-15 years old": 0,
    "0-10 years old": 0
  },
  "extra_refrigerator_pickup": {
    "no": 0,
    "yes": 100
  },
  "unplug_refrigerator": {
    "no": 0,
    "yes": 50
  },
  "smart_power_strips": {
    "no": 0,
    "yes": 50
  },
  "install_electricity_monitor": {
    "no": 0,
    "yes": 50
  },
  "transportation_car_type": {
    "electric / hybrid": 0,
    "gas / diesel ": 0
  },
  "reduce_total_mileage": {
    "none": 0,
    "5000": 50,
    "10000": 100,
    "15000": 200,
    "20000": 300
  },
  "carpooling_increase": {
    "no": 0,
    "yes": 100
  },
  "carpooling_amount": {
    "1 ": 10,
    "2 ": 20,
    "3": 30,
    "4": 40,
    "5": 50,
    "6": 60
  },
  "transportation_public": {
    "no": 0,
    "yes": 0
  },
  "transportation_public_amount": {
    "1 ": 10,
    "2 ": 20,
    "3": 30,
    "4": 40,
    "5": 50,
    "6": 60
  },
  "transportation_telecommute": {
    "no": 0,
    "yes": 0
  },
  "transportation_telecommute_amount": {
    "1 ": 10,
    "2 ": 20,
    "3": 30,
    "4": 40,
    "5": 50,
    "6": 60
  },
  "transportation_commute_bike_walk": {
    "no": 0,
    "yes": 0
  },
  "transportation_commute_bike_walk_amount": {
    "1 ": 10,
    "2 ": 20,
    "3": 30,
    "4": 40,
    "5": 50,
    "6": 60
  },
  "transportation_flights": {
    "no": 0,
    "yes": 100
  },
  "eating_switch_meals": {
    "no": 0,
    "yes": 0
  },
  "eating_switch_meals_amount": {
    "none": 0,
    "1 to 2 meals": 50,
    "3 to 4 meals": 100,
    "5 to 6 meals": 200,
    "7 to 8 meals": 400
  },
  "family_size": {
    "1 ": 10,
    "2 ": 20,
    "3": 30,
    "4": 40,
    "5": 50,
    "6": 60
  },
  "reuse_containers": {
    "usually": 50,
    "sometimes": 30,
    "rarely": 10,
    "never": 0
  },
  "buy_bulk": {
    "usually": 50,
    "sometimes": 30,
    "rarely": 10,
    "never": 0
  },
  "buy_recycled": {
    "usually": 50,
    "sometimes": 30,
    "rarely": 10,
    "never": 0
  },
  "buy_sell_used": {
    "usually": 50,
    "sometimes": 30,
    "rarely": 10,
    "never": 0
  },
  "": {
  }
}
