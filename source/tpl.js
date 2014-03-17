var jade = require("jade"); module.exports = { "404": function template(locals) {
var buf = [];
var jade_mixins = {};
var jade_interp;

buf.push("<h1>404</h1><p>there is nothing...</p>");;return buf.join("");
}, "base": function template(locals) {
var buf = [];
var jade_mixins = {};
var jade_interp;
;var locals_for_with = (locals || {});(function (window) {
buf.push("<header><nav><a href=\"/\">Home</a><a href=\"#\">link</a><a href=\"#\">link</a><a href=\"#\">link</a></nav><div class=\"user\">");
if ( window.user)
{
buf.push("hi, " + (jade.escape((jade_interp = window.user.username) == null ? '' : jade_interp)) + "<a href=\"#\">message</a><a href=\"#\">profile</a><a href=\"#\">setting</a>");
if ( window.user.admin)
{
buf.push("<a href=\"#\">admin</a>");
}
}
else
{
buf.push("<a href=\"/login\">login</a>or<a href=\"/register\">register</a>");
}
buf.push("</div></header><div id=\"contain\"></div><div id=\"tip\">loading</div>");}("window" in locals_for_with?locals_for_with.window:typeof window!=="undefined"?window:undefined));;return buf.join("");
}, "login": function template(locals) {
var buf = [];
var jade_mixins = {};
var jade_interp;

buf.push("<form id=\"login-form\" action=\"/api/login\"><input name=\"username\" placeholder=\"username\"/><input name=\"password\" placeholder=\"password\" type=\"password\"/><button type=\"submit\">login</button></form>");;return buf.join("");
}};