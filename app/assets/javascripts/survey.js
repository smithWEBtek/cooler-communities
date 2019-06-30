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
      categoryTabsDiv.append(`<div class="category-image"><img id="${page.name}" src="${response.url}" class="survey__category-tab survey__category-tab-image" /></div>`)
      categoryTabHandler(page.name);
    })
  })
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
    currentTab.classList.add('survey__category-tab-completed');
  })
}

function saveCategoryResults(results) {
  let dataObject = {
    category: results.category,
    data: results.data
  }

  $.post({
    url: '/responses',
    dataType: 'json',
    data: dataObject,
  }).done(function (data) {
    // loadCommunityPoints();
    // loadCategoryPoints(data.category.id);
    // loadGroupPoints(data.category.id);
    // debugger;

    let category_points = 0;
    data.responses.forEach(function (res) {
      category_points += res.points
    })
    loadUserPoints(category_points);
    // $('.survey__points-category-total')[0].innerText = `${data.category.name}: ${category_points}`;
    thankyouMessage(data.category, category_points);
  })
}

// function loadCategoryPoints(id) {
//   $.ajax({
//     url: `/categories/${id}`,
//     dataType: 'json'
//   }).done(function (data) {
//     console.log("data.total_points: ", data.total_points)
//     $('div.survey__points_user_total--co2').innerText = data.total_points
//   })
// }

function loadUserPoints(points) {
  $('div.survey__points-user-total--co2').innerText = points
}


function thankyouMessage(category, points) {
  category = category.name.toLowerCase()
    .split(' ')
    .map((s) => s.charAt(0).toUpperCase() + s.substring(1))
    .join(' ');
  $('.summary').css('display', 'inline')
  $('.summary__body')[0].children[0].innerText = (`Thanks for completing the ${category} category.\n Your chosen actions will reduce Carbon Emissions by: ${points} points!`)
}
