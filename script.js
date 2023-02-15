let openfile = '';

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


function readFile(file) {
    return new Promise((resolve, reject) => {
        let fr = new FileReader();
        fr.onload = x=> resolve(fr.result);
        fr.readAsText(file);
    })}

async function read(input) {
    for (let f = 0; f < input.files.length; f++) {
        let fileContents = await readFile(input.files[f]);
        let fileList = document.getElementById("file_list");
        let fileView = document.createElement('li');
        fileView.appendChild(document.createTextNode(input.files[f].name));
        fileList.appendChild(fileView);
    }
    document.getElementById("open_file").value = await readFile(input.files[0]);
}