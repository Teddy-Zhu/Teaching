!function(o){o.fn.TeachDialog=function(n){function t(o,n){return Math.random()>.5?-1:1}function a(){return"TeachDialog-"+["1","2","3","4","5","6","7","8","9","0","Q","q","W","w","E","e","R","r","T","t","Y","y","U","u","I","i","O","o","P","p","A","a","S","s","D","d","F","f","G","g","H","h","J","j","K","k","L","l","Z","z","X","x","C","c","V","v","B","b","N","n","M","m"].sort(t).join("").substring(5,20)}var i,e={modalId:null,animation:null,title:"系统信息",content:"<p>Content</p>",showCloseButton:!0,showCloseButtonName:"关闭",CloseButtonAddFunc:function(){},otherButtons:[],otherButtonStyles:[],bootstrapModalOption:{backdrop:"static"},largeSize:!1,smallSize:!1,dialogShow:function(){},dialogShown:function(){},dialogHide:function(){},dialogHidden:function(){},clickButton:function(o,n,t){}};return n=o.extend(e,n),i="",o.fn.extend({closeDialog:function(o){var n=o;n.modal("hide")}}),this.each(function(){var t,e,l,d,s,c,u=o(this);for(i=null==n.modalID?a():n.modalID,t='<div class="modal" id="{ID}" role="dialog" tabindex="-1" aria-hidden="true"><div class="modal-dialog {LargeModal}"><div class="modal-content"><div class="modal-header"><button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span></button><h1 class="modal-title">{title}</h1></div><div class="modal-body">{body}</div><div class="modal-footer">{button}</div></div></div></div>',e='<button class="btn modalclosebtn" data-dismiss="modal" aria-hidden="true">{CloseName}</button>',!n.showCloseButton&&n.otherButtons.length>0&&(e=""),l="",n.largeSize&&(l="modal-lg"),n.smallSize&&(l="modal-sm"),n.largeSize&&n.smallSize&&(l=""),d="cls-"+i,s=0;s<n.otherButtons.length;s++)e+='<button buttonIndex="'+s+'" class="'+d+" btn "+n.otherButtonStyles[s]+'">'+n.otherButtons[s]+"</button>";t=t.replace(/{LargeModal}/g,l).replace(/{ID}/g,i).replace(/{title}/g,n.title).replace(/{body}/g,n.content).replace(/{button}/g,e).replace(/{CloseName}/g,n.showCloseButtonName),u.append(t),c=o("#"+i),o(".modalclosebtn").click(function(){n.CloseButtonAddFunc()}),o("."+d).click(function(){var t=o(this).attr("buttonIndex");n.clickButton(o(this),c,t)}),c.on("show.bs.modal",function(){n.dialogShow()}),c.on("shown.bs.modal",function(){n.dialogShown()}),c.on("hide.bs.modal",function(){n.dialogHide()}),c.on("hidden.bs.modal",function(){n.dialogHidden(),c.remove()}),c.modal(n.bootstrapModalOption),null==n.animation?c.addClass(o("#dialoganimation").html()).one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",function(){o(this).removeClass(o("#dialoganimation").html())}):c.addClass(n.animation).one("webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend",function(){o(this).removeClass(n.animation)})})},o.extend({TeachDialog:function(n){o("body").TeachDialog(n)}})}(jQuery);