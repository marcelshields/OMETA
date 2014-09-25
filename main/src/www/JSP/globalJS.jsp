<!--<script src="scripts/jquery/jquery-1.7.2.js"></script>-->
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript">
  jQuery.curCSS = jQuery.css;
</script>
<!--<script src="scripts/jquery/jquery-ui.js"></script>-->
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.10.3/jquery-ui.min.js"></script>
<script type="text/javascript">
/* Customized jQuery UI snippets
 * by hkim
 */
(function( $ ) {
    $.widget( "ui.combobox", {
        _create: function() {
            var self = this,
                select = this.element.hide(),
                selected = select.children( ":selected" ),
                value = selected.val() ? selected.text() : "";
            var input = this.input = $( "<input>" )
                .insertAfter( select )
                .val( value )
                .autocomplete({
                    delay: 0,
                    minLength: 0,
                    source: function( request, response ) {
                        var matcher = new RegExp( $.ui.autocomplete.escapeRegex(request.term), "i" );
                        response( select.children( "option" ).map(function() {
                            var text = $( this ).text();
                            if ( this.value && ( !request.term || matcher.test(text) ) )
                                return {
                                    label: text.replace(
                                        new RegExp(
                                            "(?![^&;]+;)(?!<[^<>]*)(" +
                                            $.ui.autocomplete.escapeRegex(request.term) +
                                            ")(?![^<>]*>)(?![^&;]+;)", "gi"
                                        ), "<strong>$1</strong>" ),
                                    value: text,
                                    option: this
                                };
                        }) );
                    },
                    select: function( event, ui ) {
                        var curr = ui.item;
                        comboBoxChanged(curr.option, select.attr('id'));
                        curr.option.selected = true;
                        self._trigger( "selected", event, {
                            item: curr.option
                        });
                    },
                    change: function( event, ui ) {
                        if ( !ui.item ) {
                            var matcher = new RegExp( "^" + $.ui.autocomplete.escapeRegex( $(this).val() ) + "$", "i" ),
                                valid = false;
                            select.children( "option" ).each(function() {
                                if ( $( this ).text().match( matcher ) ) {
                                    this.selected = valid = false;
                                    return false;
                                }
                            });
                            if ( !valid ) {
                                // remove invalid value, as it didn't match anything
                                $( this ).val( "" );
                                select.val( "" );
                                input.data( "autocomplete" ).term = "";
                                return false;
                            }
                        }
                    }
                })
                .addClass( "ui-widget ui-widget-content ui-corner-left" );

            input.data( "ui-autocomplete" )._renderItem = function( ul, item ) {
                return $( "<li></li>" )
                    .data( "item.autocomplete", item )
                    .append( "<a>" + item.label + "</a>" )
                    .appendTo( ul );
            };

            this.button = $( "<button type='button'><span class=\"caret\"></span></button>" )
                .attr( "tabIndex", -1 )
                .attr( "title", "Show All Items" )
                .insertAfter( input )
                .button({
                    icons: {
                        primary: "ui-icon-triangle-1-s"
                    },
                    text: false
                })
                .removeClass( "ui-corner-all" )
                .addClass( "ui-corner-right ui-button-icon" )
                .click(function() {
                    // close if already visible
                    if ( input.autocomplete( "widget" ).is( ":visible" ) ) {
                        input.autocomplete( "close" );
                        return;
                    }

                    // work around a bug (likely same cause as #5265)
                    $( this ).blur();

                    // pass empty string as value to search for, displaying all results
                    input.autocomplete( "search", "" );
                    input.focus();
                });
        },

        destroy: function() {
            this.input.remove();
            this.button.remove();
            this.element.show();
            $.Widget.prototype.destroy.call( this );
        }
    });
})( jQuery );
</script>
<script src="https://s3.amazonaws.com/ceirs-public/js/app.config.js"></script>
<!-- BOOTSTRAP JS -->
<script src="https://s3.amazonaws.com/ceirs-public/js/libs/bootstrap.js"></script>

<!-- JARVIS WIDGETS -->
<script src="https://s3.amazonaws.com/ceirs-public/js/smartwidgets/jarvis.widget.min.js"></script>
<script src="https://s3.amazonaws.com/ceirs-public/js/app.js"></script>
<script src="scripts/ometa.utils.js"></script>

<script>
<jsp:useBean id="userBean" class="org.jcvi.ometa.web_bean.UserInfoWebBean"/>
<jsp:setProperty name="userBean" property="userId" value="<%=request.getRemoteUser()%>"/>  

  var _searchArr = window.location.search.substr(1).split("&"),
      paramP, _temparr;
  if(_searchArr) {
    $(_searchArr).each(function() {
      _temparr=this.split("=");
      _temparr[0]==='p'?sessionStorage.setItem('pst.project', _temparr[1]):null;
    });
  }

$(document).ready(function() {
    paramP = sessionStorage.getItem('pst.project');
    $('#project_li,#cnmc_li,#gates_li').hide();
    !paramP ? $('li#project_li').show()
        :paramP==='T1D-CNMC' ? $('li#cnmc_li').show()
        :paramP==='GATES' ? $('li#gates_li').show()
        :$('li#project_li').show();


    $('div#nav ul li').mouseover(function() {
      $(this).find('ul:first').show();
    });
    $('div#nav ul li, div#nav ul li ul').mouseleave(function() {
      $('div#nav ul li ul').hide();
    });

    var userName='<jsp:getProperty name="userBean" property="fullname"/>',
        isAdmin='<jsp:getProperty name="userBean" property="admin"/>';
    _=(isAdmin!=null && isAdmin!=='null' && isAdmin==='true')?$('#admin_li').show():$('#admin_li').hide();
    if(userName!=null && userName!=='null') {
      $('div#currUserName').html(userName);
      $('.noauthuser').hide();
    } else {
      $('.authuser').hide();
      $('.noauthuser').show();
    }

    pageSetUp();
});
</script>