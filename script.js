function setCurrentYear() {
    let date = new Date();
    let currentYear = date.getFullYear().toString();
    const yearTags = document.getElementsByClassName("year");

    Array.prototype.map.call(yearTags, function (tag) {
        tag.innerHTML = currentYear;
    });
}

function openFile(fileName) {
    if (typeof fileName !== 'string') throw 'openFile(): File is not a string';

    $.ajax({
        url: "userfiles/" + fileName,
        dataType: "text",
        success: function (data) {
            // Function also treats html as text.
            // If .html(data) is used then the code for html breaks
            $("#open_file").text(data);
        }
    });
}

$(document).ready(function() {
    $('#sidebar-btn').on('click', function() {
        $('#sidebar').toggleClass('visible');
    });

    setCurrentYear();

    $(document).on('click','li',function(e){
        e.stopPropagation();
        const fileName = $(this).html();
        openFile(fileName);
    });
});
