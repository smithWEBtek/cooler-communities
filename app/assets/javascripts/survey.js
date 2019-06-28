$(() => {
  loadSurveyTabs();
});

function loadSurveyTabs() {
  surveyJSON.pages.map(page => {
    let categorySurvey = new Survey.Model(page);
    let categorySurveyDiv = $(`#${page.name}`)
    let categoryTabsDiv = $('.survey__category-tabs');
    let category = page.name;

    categorySurveyDiv.Survey({
      model: categorySurvey,
      onComplete: saveCategoryResults,
      category
    });

    $.ajax({
      url: `/img_url/${category}`,
      dataType: 'json'
    }).done(function (response) {
      categoryTabsDiv.prepend(`<div class="category-image"><img id="${page.name}" src="${response.url}" class="survey__category-tab survey__category-tab-image" /></div>`)
      categoryTabHandler(page.name);
    })
  })

  debugger;

  styleSurveyDivs();
  document.querySelector('.survey__category-view').classList.add('survey__category-default-view')
}

function categoryTabHandler(imageId) {
  $(`#${imageId}`).on('click', function (event) {
    event.preventDefault();
    let currentTab = document.getElementById(event.currentTarget.id);
    let categoryViewDiv = $(`div#${event.currentTarget.id}`);
    $('.survey__category-view').css('display', 'none');
    $('.summary__body').css('display', 'inline');

    categoryViewDiv.css('display', 'inline');
    tabSelected(currentTab);
    tabCompleted(currentTab);
  })
}

function styleSurveyDivs() {
  let surveyDivs = document.querySelectorAll('div.sv_body');
  surveyDivs.forEach(div => {
    div.style.border = '0'
  });
}

function saveCategoryResults(results) {
  let category = results.category;
  // let points = 0;
  // for (let key in results.data) {
  //   let answer = results.data[key]
  //   let pts = pointsJSON[key][answer]

  //   if (typeof pts === 'number') {
  //     points += pts
  //   }
  // }

  let resultsObject = {
    category: results.category,
    data: results.data
  }

  $.post({
    url: '/responses',
    dataType: 'json',
    data: resultsObject,
  }).done(function (results) {

    let category_points = results.category_points
    // let points = 0;
    // results.forEach(result => points += result.points);
    $('.survey__points-user-total')[0].innerText = JSON.stringify(category, category_points);
    thankyouMessage(category, category_points);
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

function thankyouMessage(category, points) {
  category = category.toLowerCase()
    .split(' ')
    .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
    .join(' ');
  $('.summary').css('display', 'inline')
  $('.summary__body')[0].children[0].innerText = (`Thanks for completing the ${category} category.\n Your chosen actions will reduce Carbon Emissions by: ${points} points!`)
}
