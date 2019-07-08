$(() => {
  getCurrentUserId();
  loadSurvey();
});

function getCurrentUserId() {
  $.ajax({
    method: 'get',
    url: '/current_user_id',
    dataType: 'json'
  }).done(function (id) {
    getResponses(id)
  })
}

function getResponses(id) {
  $.ajax({
    url: `/user_response_data/${id}`
  }).done(function (user_data) {
    loadSurvey()
    loadUserResponses(user_data)
  });
}

function loadSurvey() {
  surveyJSON.pages.map(page => {
    let categorySurvey = new Survey.Model(page);
    let categorySurveyDiv = $(`#${page.name}`)
    let categoryTabsDiv = $('.survey__category-tabs');
    let category = page.name;

    categorySurveyDiv.Survey({
      model: categorySurvey,
      listenForCategoryComplete: saveCategoryResults,
      category
    });

    $.ajax({
      url: `/img_url/${category}`,
      dataType: 'json'
    }).done(function (response) {
      categoryTabsDiv.append(`
        <div class="category-image">
          <img id="${page.name}" src="${response.url}" class="survey__category-tab survey__category-tab-image" />
        </div>`)
      categoryTabHandler(page.name);
    })
  })
  loadCommunityPoints();
}

function loadUserResponses(data) {
  // for each named tab/category, add completed class if data contains questions from that tab/category
  let categoryIds = data.questions.map(q => q.category_id);
  let uniqueCategoryIds = [...new Set(categoryIds)]

  // debugger;
  // currentTab.classList.add('survey__category-tab-completed');
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
    listenForCategoryComplete(currentTab);
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

function listenForCategoryComplete(currentTab) {
  $('input.sv_complete_btn').on('click', function (event) {
    event.preventDefault();
    currentTab.classList.add('survey__category-tab-completed');
  })
}

function saveCategoryResults(results) {
  let dataObject = { category: results.category, data: results.data }
  $.post({
    url: '/responses',
    dataType: 'json',
    data: dataObject,
  }).done(function (data) {
    $('div.survey__user-total--points')[0].innerText = data.user_total_points;
    loadCategoryPoints(data.category.id);
    loadAffiliationPoints(data.user.affiliation_id);
    loadCommunityPoints();
    surveyMessage(data.category.name, data.user_total_points)
  })
}

// points ------------------------------------------------------------------
function loadCommunityPoints() {
  $.ajax({
    url: '/community_total',
    dataType: 'json'
  }).done(function (response) {
    $('div.survey__community-total--points')[0].innerText = `${response.community_total}`;
  })
}

function loadCategoryPoints(id) {
  $.ajax({
    url: `/category_total/${id}`,
    dataType: 'json'
  }).done(function (response) {
    $('div.survey__category-total--points')[0].innerText = `${response.category_total}`;
  })
}

function loadAffiliationPoints(id) {
  $.ajax({
    url: `/affiliation_total/${id}`,
    dataType: 'json'
  }).done(function (response) {
    $('div.survey__affiliation-total--points')[0].innerText = `${response.affiliation_total}`;
  })
}

// messages ------------------------------------------------------------------
function msgCategoryComplete(categoryName, points) {
  $('#survey__message')[0].innerHTML = (`
    <div class="survey__message">
      Thanks for completing the ${categoryName} section.<br />
      Your chosen actions will reduce Carbon Emissions by: ${points} points!
    </div>
  `)
  $('#survey__message')[0].css('display', 'inline');
  // msgNextCategory(currentCategory, nextCategory);
}

function msgSurveyStart(user_id) {
  $('#survey__message')[0].innerHTML = (`
    <div class="landing-page__about">
    <p><strong>A survey to help you choose actions that reduce your carbon footprint. </strong>It is used to determine
    the value in points, equivalent to lbs. of CO2 emission or trees. CO2 and cost estimates are based on
    assumptions of average energy consumption and fuel prices, and are not intended to be exact. See notice below
    for privacy information.</p>
    <p>Copyright &copy; 2019, Town of Concord Comprehensive Sustainable Energy Committee.</p>
    </div>
  `)
  $('#survey__message')[0].css('display', 'inline');
  // userSummary(user_id);
}

function msgSurveyComplete(categoryName, points) {
  $('#survey__message')[0].innerHTML = (`
    <div class="survey__message">
      Thanks for completing the ${categoryName} section.<br />
      Your chosen actions will reduce Carbon Emissions by: ${points} points!
    </div>
  `)
  $('#survey__message')[0].css('display', 'inline');
  // userSummary(user_id);
}

function surveyMessage(text) {
  $('.survey__message').text = text;
}
