<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/mainClup.css">
<title>동아리 관리</title>
<style>
.SectionCreateCafe CreateCafe {
	margin-top: 100px;
	margin-left: auto;
	margin-right: auto;
	width: 800px;
	height: 1000px;
	background-color: #fff;
	box-shadow: 10px 14px 28px rgba(0, 0, 0, 0.25), 5px 10px 10px 10px
		rgba(0, 0, 0, 0.22)
}

.clupMake-hedder {
	text-align: center;
	font-size: 50px;
	margin-top: 50px;
	margin-bottom: 50px;
}

.SectionTitle .section_title_inner {
	padding: 24px 0 7px 0;
	font-weight: 400
}

.SectionTitle .title {
	line-height: 24px;
	font-size: 24px;
	font-weight: 400;
	color: #222;
	font-family: arial, sans-serif
}

.SectionTitle .title a:active, .SectionTitle .title a:focus,
	.SectionTitle .title a:hover {
	text-decoration: none
}

.SectionTitle .btn_title_more {
	display: inline-block;
	box-sizing: border-box;
	height: 24px;
	margin: 0 0 0 4px;
	padding: 0 9px 0 9px;
	border: 1px solid #e5e5e5;
	line-height: 22px;
	vertical-align: top;
	border-radius: 20px;
	color: #666;
	font-size: 12px;
	letter-spacing: -1px
}

.SectionTitle .btn_title_more .icon_title_more {
	display: inline-block;
	width: 5px;
	height: 7px;
	margin-left: 3px;
	vertical-align: 1.5px
}

.SectionTitle .btn_title_more:hover {
	text-decoration: none
}

.SectionTitle .txt {
	padding-top: 4px;
	font-size: 13px;
	color: #666
}

.CreateCafeHelpLayer.has_subtitle .message_area {
	margin-top: 16px
}

.CreateCafeHelpLayer .layer_content {
	padding-bottom: 32px
}

.CreateCafeHelpLayer .message_area {
	margin-top: 21px;
	padding: 20px;
	border-radius: 6px;
	background-color: #f9f9fa;
	line-height: 18px;
	font-size: 13px;
	color: #676767
}

.CreateCafeHelpLayer .message_item {
	position: relative;
	padding-left: 8px
}

.CreateCafeHelpLayer .message_item+.message_item {
	margin-top: 18px
}

.CreateCafeHelpLayer .message_item:before {
	position: absolute;
	top: 8px;
	left: 0;
	width: 2px;
	height: 2px;
	background-color: #676767;
	content: ""
}

.CreateCafeHelpLayer .message_with_title_item+.message_with_title_item {
	margin-top: 18px
}

.CreateCafe {
	padding-bottom: 100px;
	font-size: 12px
}

.CreateCafe .input_chk, .CreateCafe .input_rdo {
	margin: 0;
	padding: 0;
	vertical-align: middle
}

.CreateCafe .layer_type {
	padding: 6px 20px 0;
	border: 1px solid #888;
	background-color: #fff
}

.CreateCafe .layer_type .btn {
	margin-top: 14px;
	padding: 10px 0;
	border-top: 1px solid #e5e5e5;
	clear: both;
	text-align: center
}

.CreateCafe .layer_type .btn2 {
	clear: both;
	padding: 16px 0 10px;
	text-align: center
}

.CreateCafe .layer_type .btn, .CreateCafe .layer_type .btn2 img {
	vertical-align: top
}

.CreateCafe .layer_type .close {
	position: absolute;
	top: 8px;
	right: 8px
}

.CreateCafe .cont_layer {
	position: absolute
}

.CreateCafe .cont_layer .txt, .CreateCafe .cont_layer .txt2 {
	padding-top: 10px;
	color: #292929;
	font-weight: 700;
	letter-spacing: -1px;
	line-height: 19px
}

.CreateCafe .cont_layer .txt2 strong, .CreateCafe .cont_layer .txt strong
	{
	color: #ff4e00
}

.CreateCafe .cont_layer .txt2 strong span, .CreateCafe .cont_layer .txt strong span
	{
	white-space: nowrap
}

.CreateCafe .cont_layer .txt_v1 {
	width: 300px
}

.CreateCafe .cont_layer .dsc {
	padding-top: 5px;
	color: #787878;
	font-size: 11px;
	letter-spacing: -1px;
	line-height: 17px
}

.CreateCafe .cafe_input {
    margin:auto;
	border-collapse: collapse;
	border-top: 1px solid #666
}

.CreateCafe .dirs {
	position: relative;
	zoom: 1;
	padding-top: 2px
}

.CreateCafe .dirs select {
	width: 280px
}

.CreateCafe .dirs select+select {
	margin-left: 4px
}

.CreateCafe .dirs .dir_area {
	margin-top: 6px
}

.CreateCafe .tboff {
	display: none
}

.CreateCafe th {
	border-bottom: 1px solid #eaeaea;
	text-align: left;
	vertical-align: top
}

.CreateCafe .input_title {
	position: relative;
	display: block;
	overflow: visible;
	width: 67px;
	height: 14px;
	margin-left: 2px;
	background:
		url(https://cafe.pstatic.net/cafe4/section/create/bg_sprite_create_141223.gif)
		no-repeat
}

.CreateCafe .input_title.show_help_layer .button_help:after {
	background-position: 0 -2216px
}

.CreateCafe .button_help {
	display: block;
	position: absolute;
	top: -1px;
	right: -20px;
	width: 19px;
	height: 18px;
	cursor: pointer;
	font-size: 0
}

.CreateCafe .button_help:after {
	display: block;
	width: 13px;
	height: 14px;
	margin: 2px auto 0;
	background:
		url(https://ssl.pstatic.net/static/cafe/section/bg_sprite_3_160720.gif)
		no-repeat 0 -2186px;
	content: ""
}

.CreateCafe td {
	padding: 16px 0 18px;
	border-bottom: 1px solid #eaeaea;
	color: #424242
}

.CreateCafe td br {
	letter-spacing: 0;
	line-height: 6px
}

.CreateCafe td * {
	vertical-align: middle
}

.CreateCafe label {
	margin-right: 20px
}

.CreateCafe .txt {
	margin: 7px 0 -2px;
	color: #929292;
	font-size: 11px;
	letter-spacing: -1px
}

.CreateCafe .txt.info {
	padding: 0 0 0 16px;
	background:
		url(https://ssl.pstatic.net/static/cafe/section/bg_sprite_3_160720.gif)
		no-repeat 0 -2276px;
	color: #33ac00;
	line-height: 12px
}

.CreateCafe .txt.error {
	padding: 0 0 0 16px;
	background:
		url(https://ssl.pstatic.net/static/cafe/section/bg_sprite_3_160720.gif)
		no-repeat 0 -2306px;
	color: #ff7914;
	line-height: 12px
}

.CreateCafe .txt.txt_commerce {
	margin: 0 0 -2px;
	padding-left: 20px;
	line-height: 16px;
	background:
		url(https://ssl.pstatic.net/static/cafe/section/bg_sprite_3_160720.gif)
		no-repeat 0 -2839px;
	color: #ff7200
}

.CreateCafe .txt.txt_commerce .btn_view {
	vertical-align: 1px;
	margin-left: 6px;
	padding-right: 5px;
	background:
		url(https://ssl.pstatic.net/static/cafe/section/bg_sprite_3_160720.gif)
		no-repeat 100% -2820px;
	color: #ff7200;
	text-decoration: underline
}

.CreateCafe .note {
	display: inline-block;
	padding: 2px 0 0 16px;
	background:
		url(https://ssl.pstatic.net/static/cafe/section/bg_sprite_3_160720.gif)
		no-repeat 0 -2244px;
	color: #929292;
	font-size: 11px;
	letter-spacing: -1px
}

.CreateCafe .note.note_v1 {
	background-position: 0 -2770px;
	color: #33ac00
}

.CreateCafe .txt_area {
	margin-bottom: -3px
}

.CreateCafe .byte {
	display: inline-block;
	color: #898989;
	font-family: tahoma, sans-serif;
	font-size: 9px;
	background: transparent
}

.CreateCafe .byte strong {
	display: inline-block;
	vertical-align: top;
	color: #f8641d
}

.CreateCafe .input_area {
	position: relative
}

.CreateCafe .input_area label {
	margin-right: 0;
	font-family: tahoma, sans-serif
}

.CreateCafe .input_area .byte {
	position: absolute;
	right: 2px;
	bottom: -15px;
	width: 90px;
	text-align: right
}

.CreateCafe .FormInputText {
	display: inline-block
}

.CreateCafe .FormInputText .input_text {
	box-sizing: content-box
}

.CreateCafe .major_img {
	margin: 2px 0 2px 2px
}

.CreateCafe .major_img:after {
	display: block;
	clear: both;
	content: ""
}

.CreateCafe .major_img .thmb {
	float: left;
	margin-right: 9px
}

.CreateCafe .major_img .detail {
	float: left
}

.CreateCafe .major_img .ly_btn {
	position: relative;
	padding-bottom: 3px;
	letter-spacing: -1px
}

.CreateCafe .major_img .ly_btn button {
	vertical-align: top
}

.CreateCafe .major_img .ly_btn .btn_srch {
	width: 34px;
	height: 21px;
	margin: 0;
	background-position: -65px 0;
	cursor: pointer
}

.CreateCafe .major_img .ly_btn .btn_srch.btn_del {
	margin-left: 4px;
	background-position: -105px 0;
	cursor: default
}

.CreateCafe .major_img .ly_btn .btn_srch.btn_del.is_active {
	background-position: -105px -25px;
	cursor: pointer
}

.CreateCafe .major_img .cont_layer.layer_type {
	width: 308px;
	left: 37px;
	top: 23px
}

.CreateCafe .major_img .cont_layer.layer_type .dsc {
	vertical-align: baseline
}

.CreateCafe .major_img .dot_list {
	padding-top: 6px
}

.CreateCafe .major_img .dot_list li {
	padding: 0 0 4px 6px;
	background: url(https://cafe.pstatic.net/img/bu_arr2.gif) no-repeat 0
		7px;
	font-size: 11px;
	color: #929292;
	line-height: 16px;
	letter-spacing: -1px
}

.CreateCafe .major_img em {
	font-style: normal;
	letter-spacing: 0;
	vertical-align: baseline
}

.CreateCafe .major_img .btn_view {
	vertical-align: 1px;
	margin-left: 3px;
	padding-right: 5px;
	background: url(https://cafe.pstatic.net/img/bu_arr.gif) no-repeat 100%
		5px;
	color: #35b300;
	text-decoration: underline
}

.CreateCafe .input_rdo {
	margin-right: 3px
}

.CreateCafe .input_txt {
	height: 26px;
	padding: 3px 0 0 9px;
	border-top: 1px solid #bbb;
	border-right: 1px solid #d3d3d3;
	border-bottom: 1px solid #d3d3d3;
	border-left: 1px solid #bbb;
	background: url(https://cafe.pstatic.net/img/section/bg_input.gif)
		repeat-x;
	line-height: 15px;
	font-size: 14px;
	font-weight: 700;
	color: #323232;
	outline: none
}

.CreateCafe .input_txt:focus {
	border: 1px solid #5cc614
}

.CreateCafe .input_txt2 {
	height: 17px;
	padding: 2px 0 0 4px;
	border-top: 1px solid #c5c5c5;
	border-right: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
	border-left: 1px solid #c5c5c5;
	color: #424242;
	line-height: 15px;
	outline: none
}

.CreateCafe .input_txt2:focus {
	border: 1px solid #5cc614
}

.CreateCafe .input_txt3 {
	width: 636px;
	height: 45px;
	padding: 2px 0 0 4px;
	border-top: 1px solid #c5c5c5;
	border-right: 1px solid #d9d9d9;
	border-bottom: 1px solid #d9d9d9;
	border-left: 1px solid #c5c5c5;
	color: #424242;
	line-height: 19px;
	resize: vertical;
	outline: none
}

.CreateCafe .input_txt3:focus {
	border: 1px solid #5cc614
}

.CreateCafe .captcha_area {
	overflow: hidden
}

.CreateCafe .captcha_area img {
	float: left;
	margin-right: 18px;
	border: 1px solid #dadada
}

.CreateCafe .captcha_area .captcha_inner {
	float: left;
	padding-top: 2px
}

.CreateCafe .captcha_area .line {
	position: relative;
	padding: 0 1px;
	margin: 0 4px;
	top: -1px;
	font-size: 10px;
	color: #d9d9d9;
	vertical-align: top
}

.CreateCafe .captcha_area .link {
	line-height: 11px;
	vertical-align: top;
	font-size: 11px;
	color: #707070;
	text-decoration: underline;
	letter-spacing: -1px
}

.CreateCafe .captcha_area .captcha_description {
	margin: 1px 0 9px;
	line-height: 19px
}

.CreateCafe .captcha_area .FormInputText {
	display: block
}

.CreateCafe .captcha_area .input_txt2 {
	padding-top: 3px;
	margin-bottom: 10px;
	ime-mode: disabled;
	text-transform: uppercase;
	font-size: 11px;
	color: #939393;
	line-height: 14px;
	letter-spacing: -1px
}

.CreateCafe .captcha_area .txt {
	position: relative;
	top: -2px;
	display: inline;
	margin: 0 0 0 13px;
	line-height: 12px;
	vertical-align: top
}

.CreateCafe .cafe_agree {
	padding: 11px 0 0 15px;
	margin-bottom: -2px;
	color: #2e2e2e
}

.CreateCafe .cafe_agree .link {
	color: inherit;
	text-decoration: underline
}

.CreateCafe .group_select_area .group_select {
	width: 202px;
	vertical-align: top
}

.CreateCafe .btn_srch {
	width: 63px;
	height: 21px;
	margin-right: 4px;
	border: 0;
	background:
		url(https://cafe.pstatic.net/img/section/btn_srch_2_130711.gif)
		no-repeat 0 -25px
}

.CreateCafe .btn_srch.is_active {
	background-position: 0 0;
	cursor: pointer
}

.CreateCafe .srch_word_area {
	overflow: hidden;
	width: 526px;
	margin-top: 8px;
	border-bottom: 1px solid #e6e6e6;
	background: url(https://cafe.pstatic.net/img/section/bu_line2.gif)
		repeat-y
}

.CreateCafe .srch_word_area .cafe_keyword_list {
	overflow: hidden
}

.CreateCafe .srch_word_area .cafe_keyword_item {
	border-top: 1px solid #e6e6e6;
	float: left;
	position: relative;
	width: 105px;
	min-height: 29px
}

.CreateCafe .srch_word_area .cafe_keyword_item:nth-child(6) {
	clear: both
}

.CreateCafe .srch_word_area .cafe_keyword_item.full .cafe_keyword_number
	{
	display: none
}

.CreateCafe .srch_word_area .cafe_keyword_number {
	position: absolute;
	top: 9px;
	left: 50%;
	width: 20px;
	margin-left: -10px;
	font-family: tahoma, sans-serif;
	font-size: 9px;
	font-weight: 700;
	color: #e6e6e6;
	text-align: center
}

.CreateCafe .srch_word_area .btn_del {
	position: absolute;
	top: -2px;
	right: -3px;
	padding: 6px 7px;
	font-size: 0;
	line-height: 0
}

.CreateCafe .srch_word_area .cafe_keyword_text {
	width: 85px;
	margin: 7px 0 6px 6px;
	font-family: 돋움, dotum;
	font-size: 12px;
	font-weight: 400;
	color: #424242;
	line-height: 16px;
	word-wrap: break-word;
	word-break: break-all
}

.CreateCafe .cafe_name .input_title {
	margin-top: 27px;
	background-position: 0 0
}

.CreateCafe .cafe_name .input_txt {
	width: 631px
}

.CreateCafe .cafe_url .input_title {
	margin-top: 27px;
	background-position: 0 -20px
}

.CreateCafe .cafe_url .input_area label {
	display: inline-block;
	width: 125px
}

.CreateCafe .cafe_url .input_txt {
	width: 500px;
	margin-left: 4px
}

.CreateCafe .cafe_public_type .input_title {
	margin-top: 19px;
	background-position: 0 -40px
}

.CreateCafe .cafe_public_type .txt {
	margin: 3px 0 2px 0
}

.CreateCafe .cafe_join_type .input_title {
	margin-top: 19px;
	background-position: 0 -60px
}

.CreateCafe .cafe_join_type .input_title.off {
	width: 51px;
	margin-left: 14px;
	background-position: -12px -60px
}

.CreateCafe .cafe_join_type .txt_area {
	padding: 3px 0
}

.CreateCafe .cafe_join_type .radio {
	padding-top: 0;
	line-height: 19px
}

.CreateCafe .cafe_use_name .input_title {
	width: 80px;
	margin-top: 18px;
	background-position: 0 -80px
}

.CreateCafe .cafe_use_name .input_title.off {
	width: 67px;
	margin-left: 14px;
	background-position: -12px -80px
}

.CreateCafe .cafe_use_name .note {
	margin-top: -3px;
	line-height: 12px
}

.CreateCafe .cafe_member_list .input_title {
	width: 103px;
	margin-top: 19px;
	background-position: 0 -277px
}

.CreateCafe .cafe_member_list .input_title.off {
	width: 63px;
	margin-left: 14px;
	background-position: -12px -277px
}

.CreateCafe .cafe_member_list .txt {
	margin: 3px 0 2px 0
}

.CreateCafe .cafe_directory .input_title {
	background-image:
		url(https://ca-fe.pstatic.net/web-pc/static/img/icon_title_directory.png?7463414612398b38947518056526415e=);
	margin-top: 21px;
	background-position: 0 0
}

.CreateCafe .cafe_directory .input_title.off {
	width: 51px;
	margin-left: 14px;
	background-position: -12px 0
}

.CreateCafe .cafe_directory .txt {
	margin-left: 48px
}

.CreateCafe .cafe_region .input_title {
	background-image:
		url(https://ca-fe.pstatic.net/web-pc/static/img/icon_title_region.png?7eeed67b9c66cbe83a2558203930b893=);
	margin-top: 21px;
	background-position: 0 0
}

.CreateCafe .cafe_region .cafe_region {
	position: relative;
	display: inline-block;
	padding: 8px 12px 7px;
	border-radius: 18px;
	background-color: #eff0f2;
	line-height: 15px;
	font-size: 12px;
	color: #323232;
	vertical-align: top
}

.CreateCafe .cafe_region .button_cafe_region_delete {
	position: absolute;
	top: -6px;
	right: -7px;
	height: 20px;
	background-image:
		url(https://ca-fe.pstatic.net/web-pc/static/img/ico-write-area-delete.svg?01bcffd10fa331975edee1a922457a1c=);
	background-size: 20px 20px;
	background-repeat: no-repeat;
	width: 20px
}

.CreateCafe .cafe_keyword .input_title {
	width: 75px;
	margin-top: 22px;
	background-position: 0 -120px
}

.CreateCafe .cafe_keyword .cafe_keyword_input_area {
	margin-top: 8px
}

.CreateCafe .cafe_keyword .input_txt2 {
	width: 205px
}

.CreateCafe .cafe_keyword .btn_srch {
	margin: 0 8px 0 4px
}

.CreateCafe .cafe_description .input_title {
	margin-top: 21px;
	background-position: 0 -140px
}

.CreateCafe .cafe_description .input_title.off {
	width: 51px;
	margin-left: 14px;
	background-position: -12px -140px
}

.CreateCafe .cafe_icon .input_title {
	width: 103px;
	margin-top: 22px;
	background-position: 0 -255px
}

.CreateCafe .cafe_shortcut .input_title {
	width: 76px;
	margin-top: 19px;
	background-position: 0 -233px
}

.CreateCafe .cafe_captcha .input_title {
	margin-top: 21px;
	background-position: 0 -160px
}

.CreateCafe .agr_txt {
	padding-left: 220px;
	font-size: 12px;
	line-height: 18px
}

.CreateCafe .agr_txt input {
	width: 14px;
	height: 14px;
	margin: -2px 3px 0 0;
	vertical-align: middle
}

.CreateCafe .agr_txt a {
	color: #fc5b01;
	text-decoration: none;
	vertical-align: top !important
}

.CreateCafe .common_btn_form {
	display: block;
	padding-top: 20px;
	font-size: 0;
	text-align: center
}

.CreateCafe .common_btn_form a:active, .CreateCafe .common_btn_form a:focus,
	.CreateCafe .common_btn_form a:hover {
	text-decoration: none
}

.CreateCafe .common_btn_form.fr {
	float: right
}

.CreateCafe .common_btn_form .btn {
	min-width: 56px;
	height: 36px;
	margin: 0 2px;
	padding: 0 12px;
	line-height: 34px
}

.CreateCafe .common_btn_form .btn, .CreateCafe .common_btn_form .btn2 {
	display: inline-block;
	border: 1px solid #d3d3d3;
	background: #fff;
	font-size: 13px;
	vertical-align: top;
	color: #222;
	box-sizing: border-box
}

.CreateCafe .common_btn_form .btn2 {
	height: 30px;
	padding: 0 16px;
	line-height: 28px
}

.CreateCafe .common_btn_form button+button {
	margin-left: 4px
}

.CreateCafe .check_box {
	display: inline-block
}

.CreateCafe .check_box input {
	-webkit-appearance: none;
	float: left;
	width: 0;
	opacity: 0
}

.CreateCafe .check_box label {
	background-color: #fff;
	color: #000;
	line-height: 15px;
	vertical-align: top !important
}

.CreateCafe .check_box input+label:before {
	display: inline-block;
	width: 16px;
	height: 16px;
	margin-right: 5px;
	box-sizing: border-box;
	border: 1px solid #d3d3d3;
	vertical-align: top;
	content: ""
}

.CreateCafe .check_box input:checked+label:before {
	background-image:
		url(https://ca-fe.pstatic.net/web-pc/static/img/form_checkbox_on.svg?52225e9ac7186c09dec75fdf26eaf05e=);
	background-repeat: no-repeat;
	background-position: -1px -1px
}

.CreateCafe .check_box.only_box label:before {
	margin: 0
}

.CreateCafe .check_box input:disabled+label {
	color: rgba(0, 0, 0, .2)
}

.CreateCafe .check_box input:disabled+label:before {
	opacity: .4
}
.imgSel{
   margin-top:95px; 
}
.title_input{
    display: block;
    width: 650px;
    min-height: 200px;
    padding: 11px 12px 10px;
    border: 1px solid #ebecef;
    box-sizing: border-box;
    overflow: hidden;
    resize: none;
    word-break: break-all;
    font-size: 15px;
    letter-spacing: -.23px;
    line-height: 17px;
    outline: none;
    margin-top:15px; 
}
.buttonMake{
    margin-left: 1050px;
    margin-top: 20px;  
}

.btnSave{    
    width: 140px;
    height: 35px;
    font-family: 'Roboto', sans-serif;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 2.5px;
    font-weight: 500;
    color: #000;
    background-color: #fff;
    border: none;
    border-radius: 45px;
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease 0s;
    cursor: pointer; 
}

.btnSave:hover {
  background-color: #ff5722;
      box-shadow: 0px 15px 20px rgba(119, 29, 0, 0.73);
  color: #fff;
  transform: translateY(-7px);
}

.btnDel{   
    width: 140px;
    height: 35px;
    font-family: 'Roboto', sans-serif;
    font-size: 11px;
    text-transform: uppercase;
    letter-spacing: 2.5px;
    font-weight: 500;
    color: #000;
    background-color: #fff;
    border: none;
    border-radius: 45px;
    box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
    transition: all 0.3s ease 0s;
    cursor: pointer; 
}

.btnDel:hover {
  background-color: #ff5722;
      box-shadow: 0px 15px 20px rgba(119, 29, 0, 0.73);
  color: #fff;
  transform: translateY(-7px);
}
</style>
</head>
<body>
    <div><jsp:include page="loading.jsp"/></div>
	<div><jsp:include page="menu.jsp" /></div>
	<h1 class="clupMake-hedder">동아리 관리</h1>
	<div class="SectionCreateCafe CreateCafe">
		<form action="updateClubPost" method="post" name="frm" enctype="multipart/form-data">
			<table class="cafe_input">
				<colgroup>
					<col width="114">
					<col width="545">
				</colgroup>
				<tbody>
					<tr class="cafe_name">
						<th scope="row">
							<h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">동아리 이름</h2>
						</th>
						<td>
							<div class="input_area">
								<div class="FormInputText" >
									<input type="text" class="input_text input_txt" name="c_name" maxlength="5" value="${vo.c_name}">
								</div>
							</div>
							<p class="txt">동아리주제와 어울리는 이름으로 입력하면 많은 사람들이 동아리를 찾기가 쉬워집니다.</p>
						</td>
					</tr>
					<tr class="cafe_public_type">
						<th scope="row">
						   <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">공개여부</h2>
						</th>
						<td>
							<div class="txt_area cafe_public_type">
								<input id="publicCafe" type="radio" name="c_pchk" value="YInfo" class="input_rdo" <c:if test="${vo.c_pchk eq 'YInfo'}">checked="checked"</c:if>>
								<label for="publicCafe">공개</label>
								<input id="privateCafe" type="radio" name="c_pchk" value="NInfo" class="input_rdo" <c:if test="${vo.c_pchk eq 'NInfo'}">checked="checked"</c:if>>
								<label for="privateCafe">비공개</label>
								<p class="txt">동아리 개설자의 전화번호 공개여부입니다.</p>
							</div>					
					    </td>
					</tr>
					<tr class="cafe_directory">
						<th scope="row">
						    <h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">카테고리</h2>					
						</th>
						<td>
							<div class="SectionCreateCafeThemeDirectory">
								<div class="dirs">
									<div class="dir_theme">
										<select title="카테고리 선택" name="c_category">
											<option value="게임" <c:if test="${vo.c_category eq '게임'}">selected</c:if>>게임</option>
	                     					<option value="운동" <c:if test="${vo.c_category eq '운동'}">selected</c:if>>운동</option>
						                    <option value="공부" <c:if test="${vo.c_category eq '공부'}">selected</c:if>>공부</option>
						                    <option value="취미" <c:if test="${vo.c_category eq '취미'}">selected</c:if>>취미</option>
						                    <option value="기타" <c:if test="${vo.c_category eq '기타'}">selected</c:if>>기타</option>
										</select>
									</div>
								</div>
							</div>
						</td>
					</tr>
				    <tr class="cafe_keyword">
						<th scope="row">
					       	<h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">테그</h2>
						</th>
						<td>
							<div class="SectionCreateCafeKeyword">							
								<div class="cafe_keyword_input_area">
									<div class="FormInputText">
										<input type="text" class="input_text input_txt2" id="tag" >
									</div>
									<button type="button" title="테그 등록" class="btn_srch" id="btn_srch"></button>																	
								</div>
							</div>
							<textarea name="c_tag" placeholder="여기에 태그가 등록됩니다." class="title_input" style="height: 20px;overflow-y:visible" id="c_tag" >${vo.c_tag}</textarea>						
					    </td>
					</tr>
					<tr class="cafe_keyword">
						<th scope="row">
					       	<h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">가입조건</h2>
						</th>
						<td>
							<div class="SectionCreateCafeKeyword">							
								<div class="cafe_keyword_input_area">
									<div class="FormInputText">
										<input type="text"class="input_text input_txt2" name="c_condition" value="${vo.c_condition}">
									</div>																
								</div>
							</div>						
					    </td>
					</tr>
					<tr class="cafe_keyword">
						<th scope="row">
					       	<h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">활동장소</h2>
						</th>
						<td>
							<div class="SectionCreateCafeKeyword">							
								<div class="cafe_keyword_input_area">
									<div class="FormInputText">
										<input type="text"class="input_text input_txt2" name="c_spot" value="${vo.c_spot}">
									</div>																								
								</div>
							</div>
							<p class="txt">주로활동 하는 지역을 선택해주세요.</p>						
					    </td>
					</tr>
					<tr class="cafe_keyword">
						<th scope="row">
					       	<h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">인삿말</h2>
						</th>
						<td>
							<div>							
								<div>
									<div class="FormInputText" >
										<textarea name="c_welcome" placeholder="내용을 입력해 주세요." class="title_input" style="height: 40px;overflow-y:visible">${vo.c_welcome}</textarea>
									</div>
								</div>
							</div>
							<p class="txt">동아리를 소개하는 안삿말을 적어주세요.</p>						
					    </td>
					</tr>	
					<tr>
	                   	<th scope="row">
					       	<h2 style="margin-top: 19px; font-size:15px; margin-left:5px;font-weight:bold; text-shadow: 0 0 1px #000;">메인사진</h2>
				       	</th>
	                   	<td width=500>
	                     	<img src="http://placehold.it/150x120" id="image" width=150> 
	                     	<input type="file" name="file" class="imgSel">
	                    </td>
					</tr>					
				</tbody>
			</table>
			<div class="buttonMake">
				<input type="button" value="취소" class="btnDel" id="return">
		    	<input type="submit" value="수정하기"  class="btnSave">
		    </div>
	    </form>
	</div>
	<div><jsp:include page="footer.jsp" /></div>
</body>

<script>
	// tag 정리하기
	var tag ="";
	$("#btn_srch").on("click",function(){
		tag =$("#c_tag").val();
		tag += "#" + $("#tag").val();
		$("#c_tag").val(tag);
		$("#tag").val("");
		$("#tag").focus();
	});

	// 뒤로가기
	$(document).ready(function() {
		$("#return").click(function(){				
			window.history.back() 		
		});	    
	});
	
	//사진을 넣었는지 확인 
	var imageChk = 0;
	
   	//사진
   	$(frm.file).hide();
   	$("#image").on("click", function() {
      	$(frm.file).click();
   	});
   	$(frm.file).on("change", function() {
      	var file = $(frm.file)[0].files[0];
      	$("#image").attr("src", URL.createObjectURL(file));
      	imageChk = 1;
   	});
 
   	//서밋시
   	$(frm).submit( function(e) {
   		e.preventDefault();
        var c_name = $(frm.c_name).val();
        var c_tag = $(frm.c_tag).val();
        var c_pchk = $(frm.c_pchk).val();
        var c_category = $(frm.c_category).val();
        var c_welcome = $(frm.c_welcome).val();
        var c_condition = $(frm.c_condition).val();
        var c_pic = $(frm.file).val();
        var c_spot = $(frm.c_spot).val();

        if ($(frm.c_name).val() == "") {
        	alert("동아리이름을 입력하세요");
            $(frm.c_name).focus();
        } else if ($(frm.c_tag).val() == "") {
            alert("해쉬태그설정해주세요");
            $(frm.c_tag).focus();
        } else if (imageChk == 0) {
            alert("사진을 설정해주세요");
        }else {
            if (!confirm("동아리를 수정하시겠습니까??")) return;
            frm.submit();
        }
	});
   
</script>

</html>


