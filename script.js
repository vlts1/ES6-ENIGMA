let openFiles = [];
let lastOpenFileName = "";

class File {
    constructor(name, content) {
        if (!name.endsWith(".css") && !name.endsWith(".html") && !name.endsWith(".js")) {
            alert("File extension is unsupported. Please use JavaScript, HTML, and CSS files only.");
            throw ("File extension is unsupported");
        }

        // Name is already an ID. No need for a separate number, as every file name must be unique.
        for (let fileId = 0; fileId < openFiles.length; fileId++) {
            if (openFiles[fileId].name === name) {
                alert('File "' + name + '" already exists');
                throw ("File already exists");
            }
        }
        this.assignmentRequirementId = this.ID = Math.random().toString(16).slice(5);
        this.name = name;
        this.content = content;
    }
}


function setCurrentYear() {
    let date = new Date();
    let currentYear = date.getFullYear().toString();
    const yearTags = document.getElementsByClassName("year");

    Array.prototype.map.call(yearTags, function (tag) {
        tag.innerHTML = currentYear;
    });
}

function openDocFile(fileName) {
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

function readFile(file) {
    return new Promise((resolve, reject) => {
        let fr = new FileReader();
        fr.onload = x=> resolve(fr.result);
        fr.readAsText(file);
    })}


async function saveFiles(input) {
    for (let f = 0; f < input.files.length; f++) {
        let fileContents = await readFile(input.files[f]);
        let filesUl  = document.getElementById("file_list");
        let fileView = document.createElement('li');

        try {
            let file = new File(input.files[f].name, fileContents);
            openFiles.push(file);
        }
        catch { continue; }

        fileView.appendChild(document.createTextNode(input.files[f].name));
        filesUl.appendChild(fileView);
        automaticFileOpen(input);
    }
}

async function automaticFileOpen(userInput) {
    document.getElementById("open_file").value = await readFile(userInput.files[0]);
}

async function removeFile(fileName) {

}

async function createFile(fileName) {

}

function saveFileTextChange() {
    const newTextValue = document.getElementById("open_file").value;

    for (let fileId = 0; fileId < openFiles.length; fileId++) {
        const file = openFiles[fileId];
        if (file.name === lastOpenFileName) {
            file.content = newTextValue;
        }
    }
}

function download(strData, strFileName, strMimeType) {
    var D = document,
        A = arguments,
        a = D.createElement("a"),
        d = A[0],
        n = A[1],
        t = A[2] || "text/plain";

    //build download link:
    a.href = "data:" + strMimeType + "charset=utf-8," + escape(strData);


    if (window.MSBlobBuilder) { // IE10
        var bb = new MSBlobBuilder();
        bb.append(strData);
        return navigator.msSaveBlob(bb, strFileName);
    } /* end if(window.MSBlobBuilder) */



    if ('download' in a) { //FF20, CH19
        a.setAttribute("download", n);
        a.innerHTML = "downloading...";
        D.body.appendChild(a);
        setTimeout(function() {
            var e = D.createEvent("MouseEvents");
            e.initMouseEvent("click", true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
            a.dispatchEvent(e);
            D.body.removeChild(a);
        }, 66);
        return true;
    }; /* end if('download' in a) */



    //do iframe dataURL download: (older W3)
    var f = D.createElement("iframe");
    D.body.appendChild(f);
    f.src = "data:" + (A[2] ? A[2] : "application/octet-stream") + (window.btoa ? ";base64" : "") + "," + (window.btoa ? window.btoa : escape)(strData);
    setTimeout(function() {
        D.body.removeChild(f);
    }, 333);
    return true;
}

function downloadOpen() {
    // Fixes the bug in which files were downloading 
    // only with at least 2 files in the array
    if (openFiles.length === 1) {
        download(openFiles[0].content, 'enigma-' + openFiles[0].name, 'text/plain');
    }

    else {
        for (let fileId = 0; fileId < openFiles.length; fileId++) {
            const file = openFiles[fileId];
            if (file.name === lastOpenFileName) {
                download(file.content, 'enigma-' + file.name, 'text/plain');
                break;
            }
        }
    }
}

$(document).ready(function() {
    $('#sidebar-btn').on('click', function() {
        $('#sidebar').toggleClass('visible');
        $('#open_file_wrapper').toggleClass('pushed');
    });

    $(document).on('click','#file_list li',async function(e){
        e.stopPropagation();
        lastOpenFileName = $(this).html();
        for (let fileId = 0; fileId < openFiles.length; fileId++) {
            if (openFiles[fileId].name === lastOpenFileName) {
                document.getElementById("open_file").value = openFiles[fileId].content;
            }
        }
    });

    setCurrentYear();
});