function setCurrentYear() {
  date = new Date();
  currentYear = date.getFullYear().toString();
  const yearTags = document.getElementsByClassName("year");
  
  Array.prototype.map.call(yearTags, function (tag) {
    tag.innerHTML = currentYear;
  });
}

$(document).ready(function() {
    $('#sidebar-btn').on('click', function() {
      $('#sidebar').toggleClass('visible');
    });

    setCurrentYear();
  });

  

let openfile = '';
