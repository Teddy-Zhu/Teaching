jQuery.extend({createUploadIframe:function(D,B){console.log("ads");var C="jUploadFrame"+D;var A='<iframe id="'+C+'" name="'+C+'" style="position:absolute; top:-9999px; left:-9999px"';if(window.ActiveXObject){if(typeof B=="boolean"){A+=' src="javascript:false"'}else{if(typeof B=="string"){A+=' src="'+B+'"'}}}A+=" />";jQuery(A).appendTo(document.body);return jQuery("#"+C).get(0)},createUploadForm:function(H,I,B){var D="jUploadForm"+H;var G="jUploadFile"+H;var A=jQuery('<form  action="" method="POST" name="'+D+'" id="'+D+'" enctype="multipart/form-data"></form>');if(B){for(var E in B){jQuery('<input type="hidden" name="'+E+'" value="'+B[E]+'" />').appendTo(A)}}var C=jQuery("#"+I);var F=jQuery(C).clone();jQuery(C).attr("id",G);jQuery(C).before(F);jQuery(C).appendTo(A);jQuery(A).css("position","absolute");jQuery(A).css("top","-1200px");jQuery(A).css("left","-1200px");jQuery(A).appendTo("body");return A},ajaxFileUpload:function(E){E=jQuery.extend({},jQuery.ajaxSettings,E);var H=new Date().getTime();var C=jQuery.createUploadForm(H,E.fileElementId,(typeof(E.data)=="undefined"?false:E.data));var B=jQuery.createUploadIframe(H,E.secureuri);var A="jUploadFrame"+H;var J="jUploadForm"+H;if(E.global&&!jQuery.active++){jQuery.event.trigger("ajaxStart")}var G=false;var I={};if(E.global){jQuery.event.trigger("ajaxSend",[I,E])}var D=function(L){var N=document.getElementById(A);try{if(N.contentWindow){I.responseText=N.contentWindow.document.body?N.contentWindow.document.body.innerHTML:null;I.responseXML=N.contentWindow.document.XMLDocument?N.contentWindow.document.XMLDocument:N.contentWindow.document}else{if(N.contentDocument){I.responseText=N.contentDocument.document.body?N.contentDocument.document.body.innerHTML:null;I.responseXML=N.contentDocument.document.XMLDocument?N.contentDocument.document.XMLDocument:N.contentDocument.document}}}catch(K){jQuery.handleError(E,I,null,K)}if(I||L=="timeout"){G=true;var M;try{M=L!="timeout"?"success":"error";if(M!="error"){var O=jQuery.uploadHttpData(I,E.dataType);if(E.success){E.success(O,M)}if(E.global){jQuery.event.trigger("ajaxSuccess",[I,E])}}else{jQuery.handleError(E,I,M)}}catch(K){M="error";jQuery.handleError(E,I,M,K)}if(E.global){jQuery.event.trigger("ajaxComplete",[I,E])}if(E.global&&!--jQuery.active){jQuery.event.trigger("ajaxStop")}if(E.complete){E.complete(I,M)}jQuery(N).unbind();setTimeout(function(){try{jQuery(N).remove();jQuery(C).remove()}catch(P){jQuery.handleError(E,I,null,P)}},100);I=null}};if(E.timeout>0){setTimeout(function(){if(!G){D("timeout")}},E.timeout)}try{var C=jQuery("#"+J);jQuery(C).attr("action",E.url);jQuery(C).attr("method","POST");jQuery(C).attr("target",A);if(C.encoding){jQuery(C).attr("encoding","multipart/form-data")}else{jQuery(C).attr("enctype","multipart/form-data")}jQuery(C).submit()}catch(F){jQuery.handleError(E,I,null,F)}jQuery("#"+A).load(D);return{abort:function(){}}},handleError:function(A,D,C,B){if(A.error){A.error.call(A.context||A,D,C,B)}if(A.global){(A.context?jQuery(A.context):jQuery.event).trigger("ajaxError",[D,A,B])}},uploadHttpData:function(B,A){var C=!A;C=A=="xml"||C?B.responseXML:B.responseText;if(A=="script"){jQuery.globalEval(C)}if(A=="json"){}if(A=="html"){jQuery("<div>").html(C).evalScripts()}return C}});