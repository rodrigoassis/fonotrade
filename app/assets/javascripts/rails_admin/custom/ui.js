// jQuery Mask Plugin v1.5.4
// github.com/igorescobar/jQuery-Mask-Plugin
(function(g){var y=function(a,h,f){var k=this,x;a=g(a);h="function"===typeof h?h(a.val(),void 0,a,f):h;k.init=function(){f=f||{};k.byPassKeys=[9,16,17,18,36,37,38,39,40,91];k.translation={0:{pattern:/\d/},9:{pattern:/\d/,optional:!0},"#":{pattern:/\d/,recursive:!0},A:{pattern:/[a-zA-Z0-9]/},S:{pattern:/[a-zA-Z]/}};k.translation=g.extend({},k.translation,f.translation);k=g.extend(!0,{},k,f);a.each(function(){!1!==f.maxlength&&a.attr("maxlength",h.length);a.attr("autocomplete","off");d.destroyEvents();
d.events();d.val(d.getMasked())})};var d={getCaret:function(){var c;c=0;var b=a.get(0),d=document.selection,e=b.selectionStart;if(d&&!~navigator.appVersion.indexOf("MSIE 10"))b.focus(),c=d.createRange(),c.moveStart("character",-b.value.length),c=c.text.length;else if(e||"0"===e)c=e;return c},setCaret:function(c){var b;b=a.get(0);b.setSelectionRange?(b.focus(),b.setSelectionRange(c,c)):b.createTextRange&&(b=b.createTextRange(),b.collapse(!0),b.moveEnd("character",c),b.moveStart("character",c),b.select())},
events:function(){a.on("keydown.mask",function(){x=d.val()});a.on("keyup.mask",d.behaviour);a.on("paste.mask",function(){setTimeout(function(){a.keydown().keyup()},100)})},destroyEvents:function(){a.off("keydown.mask keyup.mask paste.mask")},val:function(c){var b=a.is("input");return 0<arguments.length?b?a.val(c):a.text(c):b?a.val():a.text()},behaviour:function(c){c=c||window.event;var b=c.keyCode||c.which;if(-1===g.inArray(b,k.byPassKeys)){var a,e=d.getCaret();e<d.val().length&&(a=!0);var f=d.getMasked();
f!==d.val()&&d.val(f);!a||65===b&&c.ctrlKey||d.setCaret(e);return d.callbacks(c)}},getMasked:function(a){var b=[],g=d.val(),e=0,p=h.length,l=0,s=g.length,m=1,t="push",q=-1,n,u;f.reverse?(t="unshift",m=-1,n=0,e=p-1,l=s-1,u=function(){return-1<e&&-1<l}):(n=p-1,u=function(){return e<p&&l<s});for(;u();){var v=h.charAt(e),w=g.charAt(l),r=k.translation[v];if(r)w.match(r.pattern)?(b[t](w),r.recursive&&(-1===q?q=e:e===n&&(e=q-m),n===q&&(e-=m)),e+=m):r.optional&&(e+=m,l-=m),l+=m;else{if(!a)b[t](v);w===v&&
(l+=m);e+=m}}a=h.charAt(n);p!==s+1||k.translation[a]||b.push(a);return b.join("")},callbacks:function(c){var b=d.val(),g=d.val()!==x;if(!0===g&&"function"===typeof f.onChange)f.onChange(b,c,a,f);if(!0===g&&"function"===typeof f.onKeyPress)f.onKeyPress(b,c,a,f);if("function"===typeof f.onComplete&&b.length===h.length)f.onComplete(b,c,a,f)}};k.remove=function(){d.destroyEvents();d.val(k.getCleanVal()).removeAttr("maxlength")};k.getCleanVal=function(){return d.getMasked(!0)};k.init()};g.fn.mask=function(a,
h){return this.each(function(){g(this).data("mask",new y(this,a,h))})};g.fn.unmask=function(){return this.each(function(){try{g(this).data("mask").remove()}catch(a){}})};g.fn.cleanVal=function(){return g(this).data("mask").getCleanVal()};g("*[data-mask]").each(function(){var a=g(this),h={};"true"===a.attr("data-mask-reverse")&&(h.reverse=!0);"false"===a.attr("data-mask-maxlength")&&(h.maxlength=!1);a.mask(a.attr("data-mask"),h)})})(window.jQuery||window.Zepto);

function fill_address_info(data) {
  $("#professional_state").prop('value', data.estado);
  $("#professional_city").prop('value', data.cidade);
  $("#professional_address").prop('value', data.tipoDeLogradouro + ' ' + data.logradouro);
  $("#professional_neighborhood").prop('value', data.bairro);
  hide_address_error();
};

function clear_address_info() {
  $("#professional_state").prop('value', '');
  $("#professional_city").prop('value', '');
  $("#professional_address").prop('value', '');
  $("#professional_neighborhood").prop('value', '');
};

function hide_address_error() {
  $("#professional_cep_field").removeClass('error');
}

function display_address_error() {
  $("#professional_cep_field").addClass('error');
  clear_address_info();
};

// jQuery document ready
$(document).on('rails_admin.dom_ready', function(){

  // Mask for zip_code
  $("#professional_cep").mask("99999-999");
  $("#professional_cpf").mask("999.999.999-99");

  $("#professional_state").prop('readonly', true);
  $("#professional_city").prop('readonly', true);
  $("#professional_address").prop('readonly', true);
  $("#professional_neighborhood").prop('readonly', true);

  $("#professional_cep").blur(function() {
    if ($("#professional_cep").prop('value') == '') {
      display_address_error();
    } else {
      $.ajax({
        url: 'http://correiosapi.apphb.com/cep/' + $("#professional_cep").prop('value').replace('-', ''),
        dataType: 'jsonp',
        crossDomain: true,
        contentType: "application/json",
        success: function(data) { fill_address_info(data); },
        error: function() { display_address_error(); }
      });
    }
  });

});
