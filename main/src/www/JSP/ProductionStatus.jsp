
<s:include value="TopMenu.jsp" />
    
    <style>
        p.header1, p.header1 em {
          margin-top:1em;
          margin-bottom:1em;
          font-weight:500;
          color:#0081b3;
          clear: both;
          font-size:1.5em; }
        p.header1-line {
          border-top:1px solid #cfcfcf;
          padding: .5em 0 .5em 0;
          margin-top:2em;
          margin-bottom:.5em;
          font-weight:500;
          color:#0081b3;
          clear: both;
          font-size:1.5em; }
        p.header1 em { font-size: 1em; }

        p.header2, p.header2-line {
          margin-top:1.5em;
          margin-bottom:1em;
          font-weight:500;
          color:#686F74;
          font-size:1.4em; }
        p.header2-line {
          border-top: 1px solid #cfcfcf;
          padding: .5em 0 .5em 0;
          margin-top: 2em;
          margin-bottom: 0.5em;
        } /* end p.header2-line */

        p.header2 * { color: #686F74; }
        p.header3, p.header3 em {
          margin-top:.5em;
          margin-bottom:.5em;
          padding-left:.9em;
          font-weight:500;
          background: url('../images/menu_arrow.gif') no-repeat left;
          color:#0081b3;
          font-size:1.2em; }
        p.header3 em {
          background: none;
          padding: 0;
          font-size: 1em; }
        p.code { font-family: 'Courier New', Courier, monospace; }

        span.code { font-family: 'Courier New', Courier, monospace; }
        span.event1 { color: #ff0000; } /* red */
        span.event2 { color: #00ff00; } /* green */
        span.event3 { color: #ffc0cb; } /* pink */

        tr.tableHeader {
          padding: 2px;
          background-color: #a0a09b;
          color: #ffffff; }
        tr.tableRowEven {
          padding: 2px;
          background-color: #f5f5f5; }
        tr.tableRowOdd {
          padding: 2px;
          background-color: #e9e9e9; }

        tr.tableHeader td, tr.tableHeader th, tr.tableRowEven td, tr.tableRowOdd td { padding: 6px 8px; padding-bottom: 0; margin: 0; vertical-align: top; }
        #middle_content tr.tableHeader td p.bodytext, #middle_content tr.tableRowEven td p.bodytext, #middle_content tr.tableRowOdd td p.bodytext { padding: 0; margin-bottom: 6px; }
        tr.tableHeader td p.bodytext { color: #ffffff; }

        td.leftColumn { color: #ffff00; }
        td.highlight { color: #ff00ff; }

        fieldset legend:hover { cursor: pointer; }
        fieldset { padding: 5px 10px 5px 10px; }
        .collapsed { border-width: 1px 0px 0px 0px; padding: 5px 12px 0px 12px; }
        .headerContainer {width: 100%;}

        .dataTables_length { padding-left: 25px; }
        .DTTT_container { float: left !important; }
    </style>
    <s:form id="statusPage" name="statusPage"
            namespace="/"
            action="productionStatus"
            method="post" theme="simple">
        <s:hidden name="projectNames" />
        <s:hidden name="attributesOnScreen" id="attributesOnScreen"/>
        <s:hidden name="attributes" />
        <div id="HeaderPane" style="margin:15px 0 0 30px;">
            <h1>Project Status</h1>
            <div id="errorMessagesPanel" style="margin-top:15px;"></div>
            <s:if test="hasActionErrors()">
                <input type="hidden" id="error_messages" value="<s:iterator value='actionErrors'><s:property/><br/></s:iterator>"/>
            </s:if>
        </div>
        <div id="middle_content_template">
            <p>An Excel version of this data is also available for download
                <s:submit type="input" value="here"
                          onclick="document.statusPage.action='productionStatusExcel.action';javascript:getDisplayedAttributes();"/>.</p>
            <!--<div id="columnsTable"></div>  for column listing-->
            <fieldset>
                <legend> Show / Hide Columns </legend>
                <div id="statusTableColumnToggler"></div>
            </fieldset>
            <div id="statusTableDiv">
                <table id="statusTable" style="float:left;width:100%"></table>
            </div>
        </div>

    </s:form>
    </div><!-- end #content -->
</div><!-- end #main -->
<s:include value="globalJS.jsp" />
    
    <script src="scripts/jquery/jquery.tablesorter.js"></script>
    <script src="scripts/jquery/jquery.columnDisplay.js"></script>
    <script src="scripts/jquery/jquery.dataTables.js"></script>
    <script src="scripts/jquery/jquery.tableTools.js"></script>

    <script type="text/javascript">
        $(document).ready(function() {
            var attrs = '${attributes}', aoColumns=[];
            attrs=attrs.split(',');
            var header='<thead><tr>', hd="<th class='tableHeaderStyle'><p style='color:#FFFFFF;'>$hd$</th>";;
            $.each(attrs, function(i,v) {
                if(v!=='') {
                    aoColumns.push({'mDataProp':v});
                    header+=hd.replace('$hd$', v);
                }
            });
            header+='</tr></thead>';
            $('#statusTable').html(header);

            $("#statusTable").dataTable({
                "sDom": '<"statusTop"Tlf><"statusMain"rt><"statusBottom"ip>',
                "sPaginationType": "full_numbers",
                "bProcessing": true,
                "bServerSide": true,
                "aoColumns": aoColumns,
                "sServerMethod": "POST",
                "sAjaxSource": "productionStatusAjax.action?projectNames=${projectNames}&attributes=${attributes}",
                "aaSorting": [],
                "oTableTools": {
                    "sSwfPath": "media/copy_csv_xls_pdf.swf",
                    "sRowSelect": "multi",
                    "aButtons": [
                        {"sExtends":"csv", "bSelectedOnly":true},
                        {"sExtends":"xls", "bSelectedOnly":true},
                        {"sExtends":"pdf", "bSelectedOnly":true},
                        {"sExtends":"copy", "bSelectedOnly":true},
                        "select_all", "select_none"]

                }
            });
            var $colTable = $('#statusTable').columnDisplay({
                checkBoxContainer: '#statusTableColumnToggler',
                checkBoxDivClass: 'jcvi-cd-cbox-container',
                checkBoxDivDisabledClass: 'jcvi-cd-cbox-container-disabled',
                checkBoxClass: 'jcvi-cd-cbox',
                checkBoxLabelClass: 'jcvi-cd-cbox-label'
            });

            $('fieldset').fieldCollapse({
                collapseClass: 'collapsed',
                contentSelector: 'div',
                startCollapsed: true
            });
            
            utils.error.check();
        });

        function getDisplayedAttributes() {
            $('#attributesOnScreen').val(displayedAttributes);
        }
    </script>
</body>
</html>
