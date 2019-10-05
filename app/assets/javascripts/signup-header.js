$(document).on('turbolinks:load', function(){
  if($('.content').is('#step1')) {
    $('li.step1').addClass('active');
  }
  if($('.content').is('#step2')) {
    $('li.step1').addClass('through');
    $('li.step2').addClass('active');
　}
  if($('.content').is('#step3')) {
    $('li.step1').addClass('through');
    $('li.step2').addClass('through');
    $('li.step3').addClass('active');
　}
  if($('.content').is('#step4')) {
    $('li.step1').addClass('through');
    $('li.step2').addClass('through');
    $('li.step3').addClass('through');
    $('li.step4').addClass('active');
　}
  if($('.content').is('#done')) {
    $('li.step1').addClass('through');
    $('li.step2').addClass('through');
    $('li.step3').addClass('through');
    $('li.step4').addClass('through');
    $('li.done').addClass('active');
　}
});