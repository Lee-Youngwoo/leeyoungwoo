<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<!DOCTYPE html>
<html lang="en" class="fontawesome-i2svg-active fontawesome-i2svg-complete">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>두레비앙</title>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<!--  <link href="css/style2.css" rel="stylesheet"> -->
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<script type="text/javaScript" language="javascript" defer="defer">
	function fn_egov_link_page(pageNo) {
		location.href = "/TeamPl/ComplList.do?viewPage="
				+ pageNo
				+ "&searchCondition=${searchCondition}&searchKeyword=${searchKeyword}";
	}
</script>
<style type="text/css">
.complTable a {
        color: black; /* 원하는 텍스트 컬러 지정 */
        text-decoration: none; /* 링크 밑줄 제거 */
    }
body {
	font-family: Arial, sans-serif;
	text-align: center;
	margin: 0;
	padding: 0;
	background-color: white;
}
h1 {
	margin: 20px 0;
}
table {
	margin: 0 auto;
	border-collapse: collapse;
	width: 80%;
	background-color: #f8f9fa;
	border: 1px solid #ccc;
}
th, td {
	border: 1px solid #ccc;
	padding: 8px;
}
th {
	background-color: #f8f9fa;
}
tr:nth-child(even) {
	background-color: white;
}
a.button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #0d6efd; /* 파스텔톤 하늘색 */
	color: white;
	text-decoration: none;
	border-radius: 5px;
	border: none;
	cursor: pointer; : host , : root {
            - -fa-font-solid : normal 900 1em/ 1 "Font Awesome 6 Solid"; -
	-fa-font-regular: normal 400 1em/1 "Font Awesome 6 Regular"; -
	-fa-font-light: normal 300 1em/1 "Font Awesome 6 Light"; -
	-fa-font-thin: normal 100 1em/1 "Font Awesome 6 Thin"; -
	-fa-font-duotone: normal 900 1em/1 "Font Awesome 6 Duotone"; -
	-fa-font-sharp-solid: normal 900 1em/1 "Font Awesome 6 Sharp"; -
	-fa-font-sharp-regular: normal 400 1em/1 "Font Awesome 6 Sharp"; -
	-fa-font-brands: normal 400 1em/1 "Font Awesome 6 Brands"
}
svg:not(:host).svg-inline--fa, svg:not(:root).svg-inline--fa {
	overflow: visible;
	box-sizing: content-box
}
.svg-inline--fa {
	display: var(- -fa-display, inline-block);
	height: 1em;
	overflow: visible;
	vertical-align: -.125em
}
.svg-inline--fa.fa-2xs {
	vertical-align: .1em
}
.svg-inline--fa.fa-xs {
	vertical-align: 0
}
.svg-inline--fa.fa-sm {
	vertical-align: -.0714285705em
}
.svg-inline--fa.fa-lg {
	vertical-align: -.2em
}
.svg-inline--fa.fa-xl {
	vertical-align: -.25em
}
.svg-inline--fa.fa-2xl {
	vertical-align: -.3125em
}
.svg-inline--fa.fa-pull-left {
	margin-right: var(- -fa-pull-margin, .3em);
	width: auto
}
.svg-inline--fa.fa-pull-right {
	margin-left: var(- -fa-pull-margin, .3em);
	width: auto
}
.svg-inline--fa.fa-li {
	width: var(- -fa-li-width, 2em);
	top: .25em
}
.svg-inline--fa.fa-fw {
	width: var(- -fa-fw-width, 1.25em)
}
.fa-layers svg.svg-inline--fa {
	bottom: 0;
	left: 0;
	margin: auto;
	position: absolute;
	right: 0;
	top: 0
}
.fa-layers-counter, .fa-layers-text {
	display: inline-block;
	position: absolute;
	text-align: center
}
.fa-layers {
	display: inline-block;
	height: 1em;
	position: relative;
	text-align: center;
	vertical-align: -.125em;
	width: 1em
}
.fa-layers svg.svg-inline--fa {
	-webkit-transform-origin: center center;
	transform-origin: center center
}
.fa-layers-text {
	left: 50%;
	top: 50%;
	-webkit-transform: translate(-50%, -50%);
	transform: translate(-50%, -50%);
	-webkit-transform-origin: center center;
	transform-origin: center center
}
.fa-layers-counter {
	background-color: var(- -fa-counter-background-color, #ff253a);
	border-radius: var(- -fa-counter-border-radius, 1em);
	box-sizing: border-box;
	color: var(- -fa-inverse, #fff);
	line-height: var(- -fa-counter-line-height, 1);
	max-width: var(- -fa-counter-max-width, 5em);
	min-width: var(- -fa-counter-min-width, 1.5em);
	overflow: hidden;
	padding: var(- -fa-counter-padding, .25em .5em);
	right: var(- -fa-right, 0);
	text-overflow: ellipsis;
	top: var(- -fa-top, 0);
	-webkit-transform: scale(var(- -fa-counter-scale, .25));
	transform: scale(var(- -fa-counter-scale, .25));
	-webkit-transform-origin: top right;
	transform-origin: top right
}
.fa-layers-bottom-right {
	bottom: var(- -fa-bottom, 0);
	right: var(- -fa-right, 0);
	top: auto;
	-webkit-transform: scale(var(- -fa-layers-scale, .25));
	transform: scale(var(- -fa-layers-scale, .25));
	-webkit-transform-origin: bottom right;
	transform-origin: bottom right
}
.fa-layers-bottom-left {
	bottom: var(- -fa-bottom, 0);
	left: var(- -fa-left, 0);
	right: auto;
	top: auto;
	-webkit-transform: scale(var(- -fa-layers-scale, .25));
	transform: scale(var(- -fa-layers-scale, .25));
	-webkit-transform-origin: bottom left;
	transform-origin: bottom left
}
.fa-layers-top-right {
	top: var(- -fa-top, 0);
	right: var(- -fa-right, 0);
	-webkit-transform: scale(var(- -fa-layers-scale, .25));
	transform: scale(var(- -fa-layers-scale, .25));
	-webkit-transform-origin: top right;
	transform-origin: top right
}
.fa-layers-top-left {
	left: var(- -fa-left, 0);
	right: auto;
	top: var(- -fa-top, 0);
	-webkit-transform: scale(var(- -fa-layers-scale, .25));
	transform: scale(var(- -fa-layers-scale, .25));
	-webkit-transform-origin: top left;
	transform-origin: top left
}
.fa-1x {
	font-size: 1em
}
.fa-2x {
	font-size: 2em
}
.fa-3x {
	font-size: 3em
}
.fa-4x {
	font-size: 4em
}
.fa-5x {
	font-size: 5em
}
.fa-6x {
	font-size: 6em
}
.fa-7x {
	font-size: 7em
}
.fa-8x {
	font-size: 8em
}
.fa-9x {
	font-size: 9em
}
.fa-10x {
	font-size: 10em
}
.fa-2xs {
	font-size: .625em;
	line-height: .1em;
	vertical-align: .225em
}
.fa-xs {
	font-size: .75em;
	line-height: .0833333337em;
	vertical-align: .125em
}
.fa-sm {
	font-size: .875em;
	line-height: .0714285718em;
	vertical-align: .0535714295em
}
.fa-lg {
	font-size: 1.25em;
	line-height: .05em;
	vertical-align: -.075em
}
.fa-xl {
	font-size: 1.5em;
	line-height: .0416666682em;
	vertical-align: -.125em
}
.fa-2xl {
	font-size: 2em;
	line-height: .03125em;
	vertical-align: -.1875em
}
.fa-fw {
	text-align: center;
	width: 1.25em
}
.fa-ul {
	list-style-type: none;
	margin-left: var(- -fa-li-margin, 2.5em);
	padding-left: 0
}
.fa-ul>li {
	position: relative
}
.fa-li {
	left: calc(var(- -fa-li-width, 2em)* -1);
	position: absolute;
	text-align: center;
	width: var(- -fa-li-width, 2em);
	line-height: inherit
}
.fa-border {
	border-color: var(- -fa-border-color, #eee);
	border-radius: var(- -fa-border-radius, .1em);
	border-style: var(- -fa-border-style, solid);
	border-width: var(- -fa-border-width, .08em);
	padding: var(- -fa-border-padding, .2em .25em .15em)
}
.fa-pull-left {
	float: left;
	margin-right: var(- -fa-pull-margin, .3em)
}
.fa-pull-right {
	float: right;
	margin-left: var(- -fa-pull-margin, .3em)
}
.fa-beat {
	-webkit-animation-name: fa-beat;
	animation-name: fa-beat;
	-webkit-animation-delay: var(- -fa-animation-delay, 0s);
	animation-delay: var(- -fa-animation-delay, 0s);
	-webkit-animation-direction: var(- -fa-animation-direction, normal);
	animation-direction: var(- -fa-animation-direction, normal);
	-webkit-animation-duration: var(- -fa-animation-duration, 1s);
	animation-duration: var(- -fa-animation-duration, 1s);
	-webkit-animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	-webkit-animation-timing-function: var(- -fa-animation-timing, ease-in-out);
	animation-timing-function: var(- -fa-animation-timing, ease-in-out)
}
.fa-bounce {
	-webkit-animation-name: fa-bounce;
	animation-name: fa-bounce;
	-webkit-animation-delay: var(- -fa-animation-delay, 0s);
	animation-delay: var(- -fa-animation-delay, 0s);
	-webkit-animation-direction: var(- -fa-animation-direction, normal);
	animation-direction: var(- -fa-animation-direction, normal);
	-webkit-animation-duration: var(- -fa-animation-duration, 1s);
	animation-duration: var(- -fa-animation-duration, 1s);
	-webkit-animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	-webkit-animation-timing-function: var(- -fa-animation-timing, cubic-bezier(.28, .84, .42, 1));
	animation-timing-function: var(- -fa-animation-timing, cubic-bezier(.28, .84, .42, 1))
}
.fa-fade {
	-webkit-animation-name: fa-fade;
	animation-name: fa-fade;
	-webkit-animation-delay: var(- -fa-animation-delay, 0s);
	animation-delay: var(- -fa-animation-delay, 0s);
	-webkit-animation-direction: var(- -fa-animation-direction, normal);
	animation-direction: var(- -fa-animation-direction, normal);
	-webkit-animation-duration: var(- -fa-animation-duration, 1s);
	animation-duration: var(- -fa-animation-duration, 1s);
	-webkit-animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	-webkit-animation-timing-function: var(- -fa-animation-timing, cubic-bezier(.4, 0, .6, 1));
	animation-timing-function: var(- -fa-animation-timing, cubic-bezier(.4, 0, .6, 1))
}
.fa-beat-fade {
	-webkit-animation-name: fa-beat-fade;
	animation-name: fa-beat-fade;
	-webkit-animation-delay: var(- -fa-animation-delay, 0s);
	animation-delay: var(- -fa-animation-delay, 0s);
	-webkit-animation-direction: var(- -fa-animation-direction, normal);
	animation-direction: var(- -fa-animation-direction, normal);
	-webkit-animation-duration: var(- -fa-animation-duration, 1s);
	animation-duration: var(- -fa-animation-duration, 1s);
	-webkit-animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	-webkit-animation-timing-function: var(- -fa-animation-timing, cubic-bezier(.4, 0, .6, 1));
	animation-timing-function: var(- -fa-animation-timing, cubic-bezier(.4, 0, .6, 1))
}
.fa-flip {
	-webkit-animation-name: fa-flip;
	animation-name: fa-flip;
	-webkit-animation-delay: var(- -fa-animation-delay, 0s);
	animation-delay: var(- -fa-animation-delay, 0s);
	-webkit-animation-direction: var(- -fa-animation-direction, normal);
	animation-direction: var(- -fa-animation-direction, normal);
	-webkit-animation-duration: var(- -fa-animation-duration, 1s);
	animation-duration: var(- -fa-animation-duration, 1s);
	-webkit-animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	-webkit-animation-timing-function: var(- -fa-animation-timing, ease-in-out);
	animation-timing-function: var(- -fa-animation-timing, ease-in-out)
}
.fa-shake {
	-webkit-animation-name: fa-shake;
	animation-name: fa-shake;
	-webkit-animation-delay: var(- -fa-animation-delay, 0s);
	animation-delay: var(- -fa-animation-delay, 0s);
	-webkit-animation-direction: var(- -fa-animation-direction, normal);
	animation-direction: var(- -fa-animation-direction, normal);
	-webkit-animation-duration: var(- -fa-animation-duration, 1s);
	animation-duration: var(- -fa-animation-duration, 1s);
	-webkit-animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	-webkit-animation-timing-function: var(- -fa-animation-timing, linear);
	animation-timing-function: var(- -fa-animation-timing, linear)
}
.fa-spin {
	-webkit-animation-name: fa-spin;
	animation-name: fa-spin;
	-webkit-animation-delay: var(- -fa-animation-delay, 0s);
	animation-delay: var(- -fa-animation-delay, 0s);
	-webkit-animation-direction: var(- -fa-animation-direction, normal);
	animation-direction: var(- -fa-animation-direction, normal);
	-webkit-animation-duration: var(- -fa-animation-duration, 2s);
	animation-duration: var(- -fa-animation-duration, 2s);
	-webkit-animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	-webkit-animation-timing-function: var(- -fa-animation-timing, linear);
	animation-timing-function: var(- -fa-animation-timing, linear)
}
.fa-spin-reverse { -
	-fa-animation-direction: reverse
}
.fa-pulse, .fa-spin-pulse {
	-webkit-animation-name: fa-spin;
	animation-name: fa-spin;
	-webkit-animation-direction: var(- -fa-animation-direction, normal);
	animation-direction: var(- -fa-animation-direction, normal);
	-webkit-animation-duration: var(- -fa-animation-duration, 1s);
	animation-duration: var(- -fa-animation-duration, 1s);
	-webkit-animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	animation-iteration-count: var(- -fa-animation-iteration-count, infinite);
	-webkit-animation-timing-function: var(- -fa-animation-timing, steps(8));
	animation-timing-function: var(- -fa-animation-timing, steps(8))
}
@media ( prefers-reduced-motion :reduce) {
	.fa-beat, .fa-beat-fade, .fa-bounce, .fa-fade, .fa-flip, .fa-pulse, .fa-shake, .fa-spin, .fa-spin-pulse {
		-webkit-animation-delay: -1ms;
		animation-delay: -1ms;
		-webkit-animation-duration: 1ms;
		animation-duration: 1ms;
		-webkit-animation-iteration-count: 1;
		animation-iteration-count: 1;
		-webkit-transition-delay: 0s;
		transition-delay: 0s;
		-webkit-transition-duration: 0s;
		transition-duration: 0s
	}
}
@
-webkit-keyframes fa-beat { 0%, 90% {
	-webkit-transform: scale(1);
	transform: scale(1)
}
45
%
{
-webkit-transform
:
scale(
var(
-
-fa-beat-scale
,
1.25
)
);
transform
:
scale(
var(
-
-fa-beat-scale
,
1.25
)
)
}
}
@
keyframes fa-beat { 0%, 90% {
	-webkit-transform: scale(1);
	transform: scale(1)
}
45
%
{
-webkit-transform
:
scale(
var(
-
-fa-beat-scale
,
1.25
)
);
transform
:
scale(
var(
-
-fa-beat-scale
,
1.25
)
)
}
}
@
-webkit-keyframes fa-bounce { 0% {
	-webkit-transform: scale(1, 1) translateY(0);
	transform: scale(1, 1) translateY(0)
}
10
%
{
-webkit-transform
:
scale(
var(
-
-fa-bounce-start-scale-x
,
1.1
)
,
var(
-
-fa-bounce-start-scale-y
,
.9
)
)
translateY(
0
);
transform
:
scale(
var(
-
-fa-bounce-start-scale-x
,
1.1
)
,
var(
-
-fa-bounce-start-scale-y
,
.9
)
)
translateY(
0
)
}
30
%
{
-webkit-transform
:
scale(
var(
-
-fa-bounce-jump-scale-x
,
.9
)
,
var(
-
-fa-bounce-jump-scale-y
,
1.1
)
)
translateY(
var(
-
-fa-bounce-height
,
-.5em
)
);
transform
:
scale(
var(
-
-fa-bounce-jump-scale-x
,
.9
)
,
var(
-
-fa-bounce-jump-scale-y
,
1.1
)
)
translateY(
var(
-
-fa-bounce-height
,
-.5em
)
)
}
50
%
{
-webkit-transform
:
scale(
var(
-
-fa-bounce-land-scale-x
,
1.05
)
,
var(
-
-fa-bounce-land-scale-y
,
.95
)
)
translateY(
0
);
transform
:
scale(
var(
-
-fa-bounce-land-scale-x
,
1.05
)
,
var(
-
-fa-bounce-land-scale-y
,
.95
)
)
translateY(
0
)
}
57
%
{
-webkit-transform
:
scale(
1
,
1
)
translateY(
var(
-
-fa-bounce-rebound
,
-.125em
)
);
transform
:
scale(
1
,
1
)
translateY(
var(
-
-fa-bounce-rebound
,
-.125em
)
)
}
64
%
{
-webkit-transform
:
scale(
1
,
1
)
translateY(
0
);
transform
:
scale(
1
,
1
)
translateY(
0
)
}
100
%
{
-webkit-transform
:
scale(
1
,
1
)
translateY(
0
);
transform
:
scale(
1
,
1
)
translateY(
0
)
}
}
@
keyframes fa-bounce { 0% {
	-webkit-transform: scale(1, 1) translateY(0);
	transform: scale(1, 1) translateY(0)
}
10
%
{
-webkit-transform
:
scale(
var(
-
-fa-bounce-start-scale-x
,
1.1
)
,
var(
-
-fa-bounce-start-scale-y
,
.9
)
)
translateY(
0
);
transform
:
scale(
var(
-
-fa-bounce-start-scale-x
,
1.1
)
,
var(
-
-fa-bounce-start-scale-y
,
.9
)
)
translateY(
0
)
}
30
%
{
-webkit-transform
:
scale(
var(
-
-fa-bounce-jump-scale-x
,
.9
)
,
var(
-
-fa-bounce-jump-scale-y
,
1.1
)
)
translateY(
var(
-
-fa-bounce-height
,
-.5em
)
);
transform
:
scale(
var(
-
-fa-bounce-jump-scale-x
,
.9
)
,
var(
-
-fa-bounce-jump-scale-y
,
1.1
)
)
translateY(
var(
-
-fa-bounce-height
,
-.5em
)
)
}
50
%
{
-webkit-transform
:
scale(
var(
-
-fa-bounce-land-scale-x
,
1.05
)
,
var(
-
-fa-bounce-land-scale-y
,
.95
)
)
translateY(
0
);
transform
:
scale(
var(
-
-fa-bounce-land-scale-x
,
1.05
)
,
var(
-
-fa-bounce-land-scale-y
,
.95
)
)
translateY(
0
)
}
57
%
{
-webkit-transform
:
scale(
1
,
1
)
translateY(
var(
-
-fa-bounce-rebound
,
-.125em
)
);
transform
:
scale(
1
,
1
)
translateY(
var(
-
-fa-bounce-rebound
,
-.125em
)
)
}
64
%
{
-webkit-transform
:
scale(
1
,
1
)
translateY(
0
);
transform
:
scale(
1
,
1
)
translateY(
0
)
}
100
%
{
-webkit-transform
:
scale(
1
,
1
)
translateY(
0
);
transform
:
scale(
1
,
1
)
translateY(
0
)
}
}
@
-webkit-keyframes fa-fade { 50% {
	opacity: var(- -fa-fade-opacity, .4)
}
}
@
keyframes fa-fade { 50% {
	opacity: var(- -fa-fade-opacity, .4)
}
}
@
-webkit-keyframes fa-beat-fade { 0%, 100% {
	opacity: var(- -fa-beat-fade-opacity, .4);
	-webkit-transform: scale(1);
	transform: scale(1)
}
50
%
{
opacity
:
1;
-webkit-transform
:
scale(
var(
-
-fa-beat-fade-scale
,
1.125
)
);
transform
:
scale(
var(
-
-fa-beat-fade-scale
,
1.125
)
)
}
}
@
keyframes fa-beat-fade { 0%, 100% {
	opacity: var(- -fa-beat-fade-opacity, .4);
	-webkit-transform: scale(1);
	transform: scale(1)
}
50
%
{
opacity
:
1;
-webkit-transform
:
scale(
var(
-
-fa-beat-fade-scale
,
1.125
)
);
transform
:
scale(
var(
-
-fa-beat-fade-scale
,
1.125
)
)
}
}
@
-webkit-keyframes fa-flip { 50% {
	-webkit-transform: rotate3d(var(- -fa-flip-x, 0), var(- -fa-flip-y, 1), var(- -fa-flip-z, 0), var(- -fa-flip-angle, -180deg));
	transform: rotate3d(var(- -fa-flip-x, 0), var(- -fa-flip-y, 1), var(- -fa-flip-z, 0), var(- -fa-flip-angle, -180deg))
}
}
@
keyframes fa-flip { 50% {
	-webkit-transform: rotate3d(var(- -fa-flip-x, 0), var(- -fa-flip-y, 1), var(- -fa-flip-z, 0), var(- -fa-flip-angle, -180deg));
	transform: rotate3d(var(- -fa-flip-x, 0), var(- -fa-flip-y, 1), var(- -fa-flip-z, 0), var(- -fa-flip-angle, -180deg))
}
}
@
-webkit-keyframes fa-shake { 0% {
	-webkit-transform: rotate(-15deg);
	transform: rotate(-15deg)
}
4
%
{
-webkit-transform
:
rotate(
15deg
);
transform
:
rotate(
15deg
)
}
24
%
,
8
%
{
-webkit-transform
:
rotate(
-18deg
);
transform
:
rotate(
-18deg
)
}
12
%
,
28
%
{
-webkit-transform
:
rotate(
18deg
);
transform
:
rotate(
18deg
)
}
16
%
{
-webkit-transform
:
rotate(
-22deg
);
transform
:
rotate(
-22deg
)
}
20
%
{
-webkit-transform
:
rotate(
22deg
);
transform
:
rotate(
22deg
)
}
32
%
{
-webkit-transform
:
rotate(
-12deg
);
transform
:
rotate(
-12deg
)
}
36
%
{
-webkit-transform
:
rotate(
12deg
);
transform
:
rotate(
12deg
)
}
100
%
,
40
%
{
-webkit-transform
:
rotate(
0
);
transform
:
rotate(
0
)
}
}
@
keyframes fa-shake { 0% {
	-webkit-transform: rotate(-15deg);
	transform: rotate(-15deg)
}
4
%
{
-webkit-transform
:
rotate(
15deg
);
transform
:
rotate(
15deg
)
}
24
%
,
8
%
{
-webkit-transform
:
rotate(
-18deg
);
transform
:
rotate(
-18deg
)
}
12
%
,
28
%
{
-webkit-transform
:
rotate(
18deg
);
transform
:
rotate(
18deg
)
}
16
%
{
-webkit-transform
:
rotate(
-22deg
);
transform
:
rotate(
-22deg
)
}
20
%
{
-webkit-transform
:
rotate(
22deg
);
transform
:
rotate(
22deg
)
}
32
%
{
-webkit-transform
:
rotate(
-12deg
);
transform
:
rotate(
-12deg
)
}
36
%
{
-webkit-transform
:
rotate(
12deg
);
transform
:
rotate(
12deg
)
}
100
%
,
40
%
{
-webkit-transform
:
rotate(
0
);
transform
:
rotate(
0
)
}
}
@
-webkit-keyframes fa-spin { 0% {
	-webkit-transform: rotate(0);
	transform: rotate(0)
}
100
%
{
-webkit-transform
:
rotate(
360deg
);
transform
:
rotate(
360deg
)
}
}
@
keyframes fa-spin { 0% {
	-webkit-transform: rotate(0);
	transform: rotate(0)
}
100
%
{
-webkit-transform
:
rotate(
360deg
);
transform
:
rotate(
360deg
)
}
}
.fa-rotate-90 {
	-webkit-transform: rotate(90deg);
	transform: rotate(90deg)
}
.fa-rotate-180 {
	-webkit-transform: rotate(180deg);
	transform: rotate(180deg)
}
.fa-rotate-270 {
	-webkit-transform: rotate(270deg);
	transform: rotate(270deg)
}
.fa-flip-horizontal {
	-webkit-transform: scale(-1, 1);
	transform: scale(-1, 1)
}
.fa-flip-vertical {
	-webkit-transform: scale(1, -1);
	transform: scale(1, -1)
}
.fa-flip-both, .fa-flip-horizontal.fa-flip-vertical {
	-webkit-transform: scale(-1, -1);
	transform: scale(-1, -1)
}
.fa-rotate-by {
	-webkit-transform: rotate(var(- -fa-rotate-angle, none));
	transform: rotate(var(- -fa-rotate-angle, none))
}
.fa-stack {
	display: inline-block;
	vertical-align: middle;
	height: 2em;
	position: relative;
	width: 2.5em
}
.fa-stack-1x, .fa-stack-2x {
	bottom: 0;
	left: 0;
	margin: auto;
	position: absolute;
	right: 0;
	top: 0;
	z-index: var(- -fa-stack-z-index, auto)
}
.svg-inline--fa.fa-stack-1x {
	height: 1em;
	width: 1.25em
}
.svg-inline--fa.fa-stack-2x {
	height: 2em;
	width: 2.5em
}
.fa-inverse {
	color: var(- -fa-inverse, #fff)
}
.fa-sr-only, .sr-only {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	white-space: nowrap;
	border-width: 0
}
.fa-sr-only-focusable:not(:focus), .sr-only-focusable:not(:focus) {
	position: absolute;
	width: 1px;
	height: 1px;
	padding: 0;
	margin: -1px;
	overflow: hidden;
	clip: rect(0, 0, 0, 0);
	white-space: nowrap;
	border-width: 0
}
.svg-inline--fa .fa-primary {
	fill: var(- -fa-primary-color, currentColor);
	opacity: var(- -fa-primary-opacity, 1)
}
.svg-inline--fa .fa-secondary {
	fill: var(- -fa-secondary-color, currentColor);
	opacity: var(- -fa-secondary-opacity, .4)
}
.svg-inline--fa.fa-swap-opacity .fa-primary {
	opacity: var(- -fa-secondary-opacity, .4)
}
.svg-inline--fa.fa-swap-opacity .fa-secondary {
	opacity: var(- -fa-primary-opacity, 1)
}
.svg-inline--fa mask .fa-primary, .svg-inline--fa mask .fa-secondary {
	fill: #000
}
.fa-duotone.fa-inverse, .fad.fa-inverse {
	color: var(- -fa-inverse, #fff)
}
</style>
<link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet">
<link href="css/styles.css" rel="stylesheet">
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
<style type="text/css">
/* Chart.js */
@
keyframes chartjs-render-animation {from { opacity:.99
}
to {
	opacity: 1
}
}
.chartjs-render-monitor {
	animation: chartjs-render-animation 1ms
}
.chartjs-size-monitor, .chartjs-size-monitor-expand, .chartjs-size-monitor-shrink {
	position: absolute;
	direction: ltr;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	overflow: hidden;
	pointer-events: none;
	visibility: hidden;
	z-index: -1
}
.chartjs-size-monitor-expand>div {
	position: absolute;
	width: 1000000px;
	height: 1000000px;
	left: 0;
	top: 0
}
.chartjs-size-monitor-shrink>div {
	position: absolute;
	width: 200%;
	height: 200%;
	left: 0;
	top: 0
}
.ttrr{
	background: rgb(200, 200, 200);
}
.card-body{
	text-align: center;
}
  /* 버튼 스타일 */
        .complButton {
            display: inline-block;
            padding: 10px 20px;
            background-color: #007BFF; /* 배경색 설정 */
            color: #fff; /* 글자색 설정 */
            text-decoration: none; /* 링크 밑줄 제거 */
            border: none; /* 테두리 제거 */
            border-radius: 5px; /* 버튼 테두리 둥글게 만들기 */
            cursor: pointer; /* 커서 스타일 변경 */
        }

        /* 마우스 호버 시 버튼 스타일 변경 */
        .complButton:hover {
            background-color: #0056b3; /* 호버 시 배경색 변경 */
            color: white;
        }
</style>
</head>
<body class="sb-nav-fixed">
	<nav class="sb-topnav navbar navbar-expand navbar-light bg-light">
		<!-- Navbar Brand-->
		<a class="navbar-brand ps-3" href="main.do">DuraeBiang 두레비앙</a>
		<!-- Sidebar Toggle-->
		<button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!">
			<svg class="svg-inline--fa fa-bars" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="bars" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg="">
                <path fill="currentColor" d="M0 96C0 78.3 14.3 64 32 64H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32C14.3 128 0 113.7 0 96zM0 256c0-17.7 14.3-32 32-32H416c17.7 0 32 14.3 32 32s-14.3 32-32 32H32c-17.7 0-32-14.3-32-32zM448 416c0 17.7-14.3 32-32 32H32c-17.7 0-32-14.3-32-32s14.3-32 32-32H416c17.7 0 32 14.3 32 32z">
                </path>
            </svg>
			<!-- <i class="fas fa-bars"></i> Font Awesome fontawesome.com -->
		</button>
		<!-- Navbar Search-->
		<form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
			<div class="input-group">
				<c:if test="${sessionScope.id ne null}">
					<h3>반갑습니다. ${sessionScope.id} 님!</h3>
				</c:if>
		</form>
		<!-- Navbar-->
		<ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
			<li class="nav-item dropdown"><a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><svg class="svg-inline--fa fa-user fa-fw" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="user" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512" data-fa-i2svg="">
                        <path fill="currentColor" d="M224 256A128 128 0 1 0 224 0a128 128 0 1 0 0 256zm-45.7 48C79.8 304 0 383.8 0 482.3C0 498.7 13.3 512 29.7 512H418.3c16.4 0 29.7-13.3 29.7-29.7C448 383.8 368.2 304 269.7 304H178.3z">
                        </path>
                    </svg> <!-- <i class="fas fa-user fa-fw"></i> Font Awesome fontawesome.com --></a>
				<ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
					<c:choose>
						<c:when test="${sessionScope.id ne null}">
							<li><a class="dropdown-item" href="MyCompl.do?id=${sessionScope.id}">마이페이지</a></li>
							<li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li><a class="dropdown-item" href="loginWrite.do">로그인</a></li>
							<li><a class="dropdown-item" href="insertMember.do">회원가입</a></li>
						</c:otherwise>
					</c:choose>

				</ul></li>
		</ul>
	</nav>
	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<nav class="sb-sidenav accordion sb-sidenav-light" id="sidenavAccordion">
				<div class="sb-sidenav-menu">
					<div class="nav">
						<div class="sb-sidenav-menu-heading"></div>
						<a class="nav-link" href="NoticeList.do">
							<div class="sb-nav-link-icon">
								<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="gauge-high" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor" d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
                                    </path>
                                </svg>
								<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
							</div> 공지사항
						</a> <a class="nav-link" href="ComplList.do">
							<div class="sb-nav-link-icon">
								<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="gauge-high" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor" d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
                                    </path>
                                </svg>
								<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
							</div> 건의사항
						</a> <a class="nav-link" href="ProductList.do">
							<div class="sb-nav-link-icon">
								<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="gauge-high" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor" d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
                                    </path>
                                </svg>
								<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
							</div> SHOP <c:if test="${sessionScope.level eq 'admin'}">
								<a class="nav-link" href="ListMember.do">
									<div class="sb-nav-link-icon">
										<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="gauge-high" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor" d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
                                    </path>
                                </svg>
										<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
									</div> 회원관리
								</a>
								<a class="nav-link" href="MenuList.do">
									<div class="sb-nav-link-icon">
										<svg class="svg-inline--fa fa-gauge-high" aria-hidden="true" focusable="false" data-prefix="fas" data-icon="gauge-high" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg="">
                                    <path fill="currentColor" d="M0 256a256 256 0 1 1 512 0A256 256 0 1 1 0 256zM288 96a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM256 416c35.3 0 64-28.7 64-64c0-17.4-6.9-33.1-18.1-44.6L366 161.7c5.3-12.1-.2-26.3-12.3-31.6s-26.3 .2-31.6 12.3L257.9 288c-.6 0-1.3 0-1.9 0c-35.3 0-64 28.7-64 64s28.7 64 64 64zM176 144a32 32 0 1 0 -64 0 32 32 0 1 0 64 0zM96 288a32 32 0 1 0 0-64 32 32 0 1 0 0 64zm352-32a32 32 0 1 0 -64 0 32 32 0 1 0 64 0z">
                                    </path>
                                </svg>
										<!-- <i class="fas fa-tachometer-alt"></i> Font Awesome fontawesome.com -->
									</div> 이달의 메뉴
								</a>
							</c:if>
						</a>
					</div>
				</div>
			</nav>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="card mb-4">
					<div class="card-body">
						<h1>건의 목록</h1>
					</div>
				</div>
					<center>
						<form action="ComplList.do" method="get">
							<table border="1" cellpadding="0" cellspacing="0" width="800">
								<tr>
									<td align="right"><select name="searchCondition" id="searchCondition">
											<option value="ctitle">제목</option>
											<option value="ccontent">내용</option>
									</select> <input name="searchKeyword" type="text" /> <button type="submit" class="btn btn-secondary">검색</button></td>
								</tr>
							</table>
						</form>
						<form:form commandName="searchVO" id="listForm" name="listForm" method="post">
							<table border="1" cellpadding="0" cellspacing="0" width="800" class="complTable">
								<tr class="ttrr">
									<td align="center" width="240">제목</td>
									<td align="center" width="60">등록일</td>
									<td align="center" width="40">조회수</td>
									<c:if test="${sessionScope.level eq 'admin'}">
										<td align="center" width="80">삭제</td>
									</c:if>
								</tr>
								<c:forEach var="compl" items="${complList}" varStatus="status">
									<tr>
										<td align="center"><c:choose>
												<c:when test="${compl.secret eq'true'}">
													<a href="selectCompl.do?cno=${compl.cno }">비밀글입니다.</a>
												</c:when>
												<c:otherwise>
													<a href="selectCompl.do?cno=${compl.cno }">${compl.ctitle}</a>
												</c:otherwise>
											</c:choose></td>
										<td align="center">${compl.cuploaddate}</td>
										<td align="center">${compl.view}</td>
										<c:if test="${sessionScope.level eq 'admin'}">
											<td align="center"><a href="deleteCompl.do?cno=${compl.cno}">삭제</a></td>
										</c:if>
									</tr>
								</c:forEach>
								<%-- <c:forEach var="compl" items="${complList}" varStatus="status">
				<input type="hidden" value="${creplyList[status.index].cNo}">
			</c:forEach> --%>
							</table>
							<br>
							<br>
							<a href="/TeamPl/insertCompl.do" class = "complButton">민원등록하기</a>
							<br><br>
							<%-- <c:if test="${sessionScope.id ne null}">
			${sessionScope.id }, ${sessionScope.name } 으로 로그인함
	</c:if> --%>
							<div id="paging">
								<ui:pagination paginationInfo="${paginationInfo }" type="image" jsFunction="fn_egov_link_page" />
								<form:hidden path="viewPage" />
							</div>
						</form:form>
						<form:form commandName="searchVO2" id="listForm" name="listForm" method="post">
							<c:forEach var="compl" items="${complList}" varStatus="status">
								<input type="hidden" value="${creplyList[status.index].cNo}">
							</c:forEach>
						</form:form>
						<!-- 							<iframe src="insertMenu.do" width="100%" height="500"
								frameborder="0"></iframe> -->
						<!-- 기존의 내용 입력  -->
					
				<center>

			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright © Your Website 2023</div>
						<div>
							<a href="#">Privacy Policy</a> · <a href="#">Terms &amp; Conditions</a>
						</div>
					</div>
				</div>
			</footer>
		</div>
	</div>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="js/scripts.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
</body>
</html>