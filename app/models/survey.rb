class Survey < ApplicationRecord

  def self.create_survey
    survey = {
    "pages": [
      {
        "name": "yard",
        "elements": [
          {
            "type": "radiogroup",
            "name": "lawn_size",
            "title": "Will you choose to reduce the size of your lawn?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "mower_type",
            "title": "Do you use a gas mower?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "mower_switch",
            "visibleIf": "{mower_type} = \"yes\"",
            "title": "Will you choose to switch away from a gas mower?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "mowing_frequency",
            "visibleIf": "{mower_type} = \"yes\"",
            "title": "Will you choose to mow your lawn less in the summer?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "fertilizer",
            "title": "Do you use fertilizer on your yard?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "fertilizer_frequency",
            "visibleIf": "{fertilizer} = \"yes\"",
            "title": "Will you choose to reduce you fertilizer applications this year?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "leaf_cleanup",
            "title": "Do you use a gas blower to clean leaves?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "leaf_cleanup_gas_blower_use",
            "visibleIf": "{leaf_cleanup} = \"yes\"",
            "title": "Will you choose to replace your gas blower?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          }
        ],
        "title": "Yard / Landscaping"
      },
      {
        "name": "weatherization",
        "elements": [
          {
            "type": "radiogroup",
            "name": "weatherized",
            "title": "Is your home well insulated/weatherized?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "energy_audit",
            "visibleIf": "{weatherized} = \"no\"",
            "title": "Will you choose to sign up for a free heating system assessment?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "insulate_home",
            "visibleIf": "{weatherized} = \"no\"",
            "title": "Will you choose to better insulate your home?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "install_programmable_thermostats",
            "title": "Will you choose to install programmable thermostats?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          }
        ],
        "title": "Weatherization and Thermostats"
      },
      {
        "name": "heating_system_type",
        "elements": [
          {
            "type": "radiogroup",
            "name": "heating_system_type1",
            "title": "What type of heating system do you have?",
            "hasOther": true,
            "choices": [
              "oil furnace",
              "forced hot air",
              "baseboard water",
              "wood fireplace",
              "solar"
            ]
          },
          {
            "type": "radiogroup",
            "name": "insulate_home1",
            "title": "Will you choose to better insulate your home?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "upgrade_heating_system",
            "title": "Will you choose to upgrade to a more efficient boiler/furnace?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          }
        ],
        "title": "Heating and Cooling systems"
      },
      {
        "name": "water_heating_system",
        "elements": [
          {
            "type": "radiogroup",
            "name": "water_heater_type",
            "title": "What type of water heater do you have in your home?",
            "choices": [
              {
                "value": "storage_tank",
                "text": "Conventional Storage Tank "
              },
              {
                "value": "tankless",
                "text": "Tankless (On-Demand)"
              },
              {
                "value": "heat_pump",
                "text": "Heat Pump (Hybrid) "
              },
              {
                "value": "solar",
                "text": "Solar Powered"
              },
              {
                "value": "condensing",
                "text": "Condensing"
              }
            ]
          },
          {
            "type": "radiogroup",
            "name": "hot_water_assessment",
            "title": "Will you choose to sign up for a free hot water assessment?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          },
          {
            "type": "radiogroup",
            "name": "replace_water_heater",
            "title": "Will you choose to replace your current water heater w/ heat pump?",
            "choices": [
              "yes",
              "no"
            ],
            "colCount": 2
          }
        ],
        "title": "Water Heating"
      }
    ],
    "showQuestionNumbers": "off"
  }
  end
end
