const express = require('express');
const app = express();
const fs = require('fs');
const path = require('path');

app.set('view engine', 'ejs');

app.use(express.static(__dirname + '/views'));
app.use(express.urlencoded({extended: true}));

app.listen(3000, () => console.log('Live on http://localhost:3000'));

app.get('/', (req, res) => {
  res.render('index', { text: 'My text' });
});

function makeDir(dirPath) {
  if (!fs.existsSync(dirPath)){
    fs.mkdirSync(dirPath, { recursive: true });
  }
}


app.post('/files/:userID/:fileName', (req, res) => {
  console.log('Server: received file post request')
  const userID      = req.params.userID;
  console.log('id: ' + userID);
  let fileName    = req.params.fileName;
  const fileContent = req.body.content;

  if (userID && fileName && fileContent) {
    const userDirPath = './views/userfiles/' + userID;
    makeDir(userDirPath);

    if (fileName === 'index.html') {
      fileName = fileName.replace(".html", ".ejs");
      fileName = userID + fileName;
    }
    const filePath = userDirPath + '/' + fileName;

    fs.writeFile(filePath, fileContent, (err) => {});
    console.log('New file at: ' + filePath);
    res.sendStatus(200);
  }
  else {
    res.sendStatus(500);
  }
});

app.get('/output/:userID', (req, res, next) => {
  const userID = req.params.userID;
  const userDirPath = './views/userfiles/' + userID;
  const indexFilePath = userDirPath + '/' + userID + 'index.ejs';
  console.log('index file path: ' + indexFilePath);

  if (fs.existsSync(indexFilePath)) {
    console.log('index file exists');
    app.use(express.static(__dirname + '/views/userfiles/'));
    res.render(path.resolve(indexFilePath));
  }

  else res.send('Error: index.html does not exist. Please create an index file.');
});