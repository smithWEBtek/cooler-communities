$(() => {
  loadSurveys();
});

let surveyJSON = { "pages": [{ "name": "yard", "elements": [{ "type": "radiogroup", "name": "lawn_size", "title": "Will you choose to reduce the size of your lawn?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "mower_type", "title": "Do you use a gas mower?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "mower_switch", "visibleIf": "{mower_type} = \"yes\"", "title": "Will you choose to switch away from a gas mower?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "mowing_frequency", "visibleIf": "{mower_type} = \"yes\"", "title": "Will you choose to mow your lawn less in the summer?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "fertilizer", "title": "Do you use fertilizer on your yard?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "fertilizer_frequency", "visibleIf": "{fertilizer} = \"yes\"", "title": "Will you choose to reduce you fertilizer applications this year?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "leaf_cleanup", "title": "Do you use a gas blower to clean leaves?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "leaf_cleanup_gas_blower_use", "visibleIf": "{leaf_cleanup} = \"yes\"", "title": "Will you choose to replace your gas blower?", "choices": ["yes", "no"], "colCount": 2 }], "title": "Yard / Landscaping" }, { "name": "weatherization", "elements": [{ "type": "radiogroup", "name": "weatherized", "title": "Is your home well insulated/weatherized?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "energy_audit", "visibleIf": "{weatherized} = \"no\"", "title": "Will you choose to sign up for a free heating system assessment?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "insulate_home", "visibleIf": "{weatherized} = \"no\"", "title": "Will you choose to better insulate your home?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "install_programmable_thermostats", "title": "Will you choose to install programmable thermostats?", "choices": ["yes", "no"], "colCount": 2 }], "title": "Weatherization and Thermostats" }, { "name": "heating", "elements": [{ "type": "radiogroup", "name": "heating_system_type1", "title": "What type of heating system do you have?", "hasOther": true, "choices": ["oil furnace", "forced hot air", "baseboard water", "wood fireplace", "solar"] }, { "type": "radiogroup", "name": "insulate_home1", "title": "Will you choose to better insulate your home?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "upgrade_heating_system", "title": "Will you choose to upgrade to a more efficient boiler/furnace?", "choices": ["yes", "no"], "colCount": 2 }], "title": "Heating and Cooling systems" }, { "name": "water", "elements": [{ "type": "radiogroup", "name": "water_heater_type", "title": "What type of water heater do you have in your home?", "choices": [{ "value": "storage_tank", "text": "Conventional Storage Tank " }, { "value": "tankless", "text": "Tankless (On-Demand)" }, { "value": "heat_pump", "text": "Heat Pump (Hybrid) " }, { "value": "solar", "text": "Solar Powered" }, { "value": "condensing", "text": "Condensing" }] }, { "type": "radiogroup", "name": "hot_water_assessment", "title": "Will you choose to sign up for a free hot water assessment?", "choices": ["yes", "no"], "colCount": 2 }, { "type": "radiogroup", "name": "replace_water_heater", "title": "Will you choose to replace your current water heater w/ heat pump?", "choices": ["yes", "no"], "colCount": 2 }], "title": "Water Heating" }, { "name": "solar", "elements": [{ "type": "radiogroup", "name": "solar_panels", "title": "Do you have a solar panel array?", "choices": ["yes", "no"] }, { "type": "radiogroup", "name": "solar_assessment", "visibleIf": "{solar_panels} = \"no\"", "title": "Will you choose to sign up for a free solar assessment?", "choices": ["yes", "no"] }, { "type": "radiogroup", "name": "question1", "visibleIf": "{solar_panels} = \"no\"", "title": "Will you choose to install a solar panel array?", "choices": ["yes", "no"] }], "title": "Solar Power" }], "showQuestionNumbers": "off" }
let categories = [];

function loadSurveys() {
  surveyJSON.pages.map(page => {
    let categorySurvey = new Survey.Model(page);
    let categorySurveyDiv = $(`#${page.name}`)
    let categoryTabsDiv = $('.survey__category-tabs');
    let category = page.name;
    categories.push(category);

    categorySurveyDiv.Survey({
      model: categorySurvey,
      onComplete: saveCategoryResults,
      category
    });
    categoryTabsDiv.prepend(`<img id="${page.name}" src="/assets/images/${page.name}.png" class="survey__category-image" />`)
    categoryButtonHandler();
  });
}

function saveCategoryResults(userResponse) {
  let response = {
    category: userResponse.category,
    data: userResponse.data
  }
  $("#surveyContainer").text(JSON.stringify(userResponse));
  $.post({
    url: '/responses',
    dataType: 'json',
    data: response,
  }).done(function (results) {

  })

  thankyouMessage(userResponse.category);
}

function categoryButtonHandler() {
  $('img.survey__category-image').on('click', function (event) {
    event.preventDefault();
    let categoryViewDiv = $(`div#${event.currentTarget.id}`);
    $('.survey__category-view').css('display', 'none');
    categoryViewDiv.css('display', 'inline');
  })
}

function thankyouMessage(category) {
  category = category.toLowerCase()
    .split(' ')
    .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
    .join(' ');
  $('div.sv_body.sv_completed_page')[0].children[0].innerText = `Thanks for completing the ${category} category!`
}
