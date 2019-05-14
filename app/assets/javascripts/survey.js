$(() => {
  loadSurveys();
  loadPointsJSON();
});

let pointsJSON = {}

function loadPointsJSON() {
  $.get('/assets/json/points.json', (data) => {
    pointsJSON = data;
  })
}

function loadSurveys() {
  $.get('/assets/json/surveyJSON.json', function (data) {
    data.pages.map(page => {
      let categorySurvey = new Survey.Model(page);
      let categorySurveyDiv = $(`#${page.name}`)
      let categoryTabsDiv = $('.survey__category-tabs');
      let category = page.name;

      categorySurveyDiv.Survey({
        model: categorySurvey,
        onComplete: saveCategoryResults,
        category
      });
      categoryTabsDiv.prepend(`<img id="${page.name}" src="/assets/images/${page.name}.png" class="survey__category-tab survey__category-tab-image" />`)
      styleSurveyDivs();
      categoryTabHandler();
    })
  });
  document.querySelector('.survey__category-view').classList.add('survey__category-default-view')
}

function styleSurveyDivs() {
  let surveyDivs = document.querySelectorAll('div.sv_body');
  surveyDivs.forEach(div => {
    div.style.border = '0'
  });
}

function saveCategoryResults(results) {
  let category = results.category;
  let resultsObject = {
    category: results.category,
    data: results.data
  }
  let points = 0;
  for (let key in results.data) {
    let answer = results.data[key]
    let pts = pointsJSON[key][answer]

    if (typeof pts === 'number') {
      points += pts
    }
  }

  $(".summary__body").text(JSON.stringify(`Your choices reduced Carbon Emissions by: ${points} points!`));

  $.post({
    url: '/responses',
    dataType: 'json',
    data: resultsObject,
  }).done(function (results) {
    let points = 0;
    results.forEach(result => points += result.points);
    $('.survey__points-user-total')[0].innerText = JSON.stringify(points);
  })
  thankyouMessage(results.category);
}

function categoryTabHandler() {
  $('img.survey__category-tab').on('click', function (event) {
    event.preventDefault();
    let currentTab = document.getElementById(event.currentTarget.id);
    let categoryViewDiv = $(`div#${event.currentTarget.id}`);
    $('.survey__category-view').css('display', 'none');
    $('.summary__body').css('display', 'inline');

    categoryViewDiv.css('display', 'inline');
    tabSelected(currentTab);
    // tabCompleted(currentTab);
  })
}

function tabSelected(currentTab) {
  currentTab.classList.add('survey__category-tab-selected')
  // let unselectedTabs = Array.from(document.getElementsByClassName('survey__category-tab'));
  // let unselectedCategories = Array.from(document.getElementsByClassName('survey__category-view'));

  // unselectedCategories.forEach(category => {
  //   category.style.display = "none"
  // });

  // unselectedTabs.forEach(tab => {
  //   if (tab.id != currentTab.id) {
  //     tab.classList.remove('survey__category-tab-selected')
  //     $('.survey__category-view').css('display', 'none');
  //   }
  // })
}

function tabCompleted(currentTab) {
  $('input.sv_complete_btn').on('click', function (event) {
    event.preventDefault();
    // debugger;
    currentTab.classList.add('survey__category-tab-completed');
  })
}

function thankyouMessage(category) {
  category = category.toLowerCase()
    .split(' ')
    .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
    .join(' ');
  $('div.sv_body.sv_completed_page')[0].children[0].innerText = `Thanks for completing the ${category} category!`
}
