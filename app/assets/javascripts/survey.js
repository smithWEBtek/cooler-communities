$(() => {
  console.log('survey.js loaded ...');

  var surveyJSON = { title: "Cooler Communities", description: "Reduce your carbon footprint.", pages: [{ name: "Solar Power", elements: [{ type: "matrix", name: "solar", title: "Solar Power", columns: ["Yes", "No"], rows: [{ value: "solarAssessment", text: "Sign up for free solar assessment?" }, { value: "installSolarPanels", text: "Install solar panels in 2019?" }] }] }, { name: "Transportation", elements: [{ type: "matrix", name: "transportation1", title: "Transportation: Cars", columns: [{ value: "keep", text: "Keep?" }, { value: "replace", text: "Replace this  year?" }], rows: [{ value: "car1", text: "Car 1" }, { value: "car2", text: "Car 2" }] }, { type: "multipletext", name: "trans-mileage", title: "Transportation: Reduce Mileage", items: [{ name: "Car1", title: "Reduce Car1 mileage by" }, { name: "Car2", title: "Reduce Car2 mileage by" }] }, { type: "checkbox", name: "trans-mileage-how", title: "Transportation: Achieve mileage reduction by (check all that apply)", hasOther: true, choices: [{ value: "carpooling", text: "Carpooling to/from work" }, { value: "public trans", text: "Train/Bus/Public transportation" }, { value: "telecommute", text: "Telecommute (work at home)" }, { value: "bike to work", text: "Bike to work when possible" }, { value: "bus/bike/walk school/work", text: "Bus/bike/walk to school or within town" }, { value: "carpool", text: "Carpool regularly to children's activities" }] }] }, { name: "Eating", elements: [{ type: "multipletext", name: "eating1", title: "Goal meals per week", items: [{ name: "goalMealsBeefLambPorkPerWeek", title: "Goal meals per week: Beef/Lamb/Poultry/Pork" }, { name: "goalMealsPoultryCheeseFishSeafood", title: "Goal meals per week: Poultry/Cheese/Fish/Seafood" }, { name: "goalMealsVegetarianCheeseEggs", title: "Goal meals per week: Vegetarian (w/ cheese, eggs)" }, { name: "goalMealsVeganNonDairy", title: "Goal meals per week: Vegetarian/Vegan (non-dairy)" }] }], title: "Eating reduced carbon meals" }, { name: "Heating & Cooling Systems", elements: [{ type: "matrix", name: "heating-cooling", title: "Heating and Cooling", columns: ["Yes", "No"], rows: [{ value: "heatingSystemAssessment", text: "Sign up for free heating system assessment?" }, { value: "upgradeBoilerFurnace", text: "Upgrade to efficient boiler/furnace?" }, { value: "installAirSourceHeatPump", text: "Install air-source heat pump(s)?" }] }] }, { name: "Home Appliances", elements: [{ type: "matrix", name: "appliances1", title: "Home Appliances", columns: ["Yes", "No"], rows: [{ value: "replaceRefridgerator", text: "Replace refrigerator with Energy Star model in 2019? " }, { value: "replaceClothesWasher", text: "Replace clothes washer with Energy Star model in 2019?" }] }, { type: "multipletext", name: "appliances2", title: "Home Laundry", items: [{ name: "goalLaundryColdWashesPerWeek", title: "Goal number of cold water wash loads per week?" }, { name: "goalLaundryLineDryPerWeek", title: "Goal number of clothes line or rack dry loads per week?" }] }] }, { name: "Lighting", elements: [{ type: "matrix", name: "lighting1", title: "Light Bulbs", columns: ["Yes", "No"], rows: [{ value: "bulbSwap", text: "Sign up for bulb swap?" }, { value: "bulbLeds", text: "Replace bulbs with LEDS this year?" }] }] }, { name: "Reuse and Recycle", elements: [{ type: "multipletext", name: "recycle", title: "Reuse and Recycle", items: [{ name: "refillableContainers", title: "Achieve reduction/recycling by using refillable containers (bags,mugs,bottles)?" }, { name: "buyBulk", title: "Achieve reduction/recycling through buying to minimize packaging (bulk, powders)?" }, { name: "buyRecycledMaterials", title: "Achieve reduction/recycling through buying items made from recycled materials?" }, { name: "buyUsed", title: "Achieve reduction/recycling through buying/selling used goods (Craigslist, consignment)?" }] }], title: "Reuse and Recycle", description: "Reuse and Recycle" }, { name: "Water Heating", elements: [{ type: "matrix", name: "water-heating", title: "Water Heating", columns: ["Yes", "No"], rows: [{ value: "hotWaterAssessment", text: "Sign up for free hot water assessment?" }, { value: "replaceWithHeatPump", text: "Replace existing water heater with heat pump?" }] }], title: "Water Heating" }, { name: "Weatherization and Thermostats", elements: [{ type: "matrix", name: "weatherization", title: "Weatherization and Thermostats", columns: ["Yes", "No"], rows: [{ value: "signupEnergyAudit", text: "Sign up for a free energy audit?" }, { value: "insulateAirSealHome", text: "Insulate and/or air-seal the home?" }, { value: "installProgrammableThermostats", text: "Install Programmable Thermostats?" }] }], title: "Weatherization and Thermostats" }, { name: "Yard and Landscaping", elements: [{ type: "matrix", name: "yard", title: "Yard and Landscaping: choices", columns: ["Yes", "No"], rows: [{ value: "lawnAssessment", text: "Sign up for low maintenance lawn assessment?" }, { value: "useRakeOrElectricBlower", text: "Use rake or electric blower for cleanup?" }, { value: "replaceGasMowerWithManualOrElectric", text: "Replace gas mower with manual or electric?" }, { value: "lowerMowingFrequency", text: "Lower frequency of mowing?" }] }, { type: "multipletext", name: "yardLandscaping", title: "Yard and Landscaping: reductions", items: [{ name: "reduceLawnSqFootage", title: "Reduce lawn size by square footage?" }, { name: "numberLawnFertilizerApplications", title: "Reduce number of fertilizer applications to?" }] }], title: "Yard and Landscaping" }] }

  let surveysDiv = $('#surveys-div');

  let categoryTabs = $('#category-tabs')

  surveyJSON.pages.map(page => {
    let categorySurvey = new Survey.Model(page);
    let categorySurveyDiv = $(`#${page.elements[0].name}`)
    // debugger;
    categorySurveyDiv.Survey({
      model: categorySurvey,
      onComplete: saveCategoryResults
    });
    categorySurveyDiv.prepend(`<img src="/assets/images/${page.elements[0].name}.png" class="category__image" />`)
  });

  function saveCategoryResults(surveyCategory) {
    console.log("results: ", JSON.stringify(surveyCategory.data));
    $("#surveyContainer").text(JSON.stringify(surveyCategory.data));
  }

  var survey = new Survey.Model(surveyJSON.pages[0]);
  $("#surveyContainer").Survey({
    model: survey,
    onComplete: saveCategoryResults
  });

});
