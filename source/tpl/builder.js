var path = require('path');
var fs = require('fs')
var write = fs.writeFileSync;
var jade = require('jade');

var file = '../tpl.js';

fs.readdir(__dirname, function(err, files){
  var res = []
  files.forEach(function(file){
    var ext = path.extname(file);
    if ('.jade' != ext) return;

    var str = fs.readFileSync(file, 'utf8');
		var fn = jade.compileClient(str, { compileClient: true, compileDebug: false });

		res.push('"'+path.basename(file, '.jade') + '": ' + fn.toString());
  })
	//console.log(res)
	write(file, 'var jade = require("jade"); module.exports = { ' + res.join(", ") + '};')
})
