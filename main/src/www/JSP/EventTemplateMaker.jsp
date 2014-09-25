<%--
  ~ Copyright J. Craig Venter Institute, 2013
  ~
  ~ The creation of this program was supported by J. Craig Venter Institute
  ~ and National Institute for Allergy and Infectious Diseases (NIAID),
  ~ Contract number HHSN272200900007C.
  ~
  ~ This program is free software: you can redistribute it and/or modify
  ~ it under the terms of the GNU General Public License as published by
  ~ the Free Software Foundation, either version 3 of the License, or
  ~ (at your option) any later version.
  ~
  ~ This program is distributed in the hope that it will be useful,
  ~ but WITHOUT ANY WARRANTY; without even the implied warranty of
  ~ MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  ~ GNU General Public License for more details.
  ~
  ~ You should have received a copy of the GNU General Public License
  ~ along with this program.  If not, see <http://www.gnu.org/licenses/>.
  --%>

<s:include value="TopMenu.jsp" />

    <style type="text/css">
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
    </style>

    <s:form id="uploadLoaderPage" name="uploadLoaderPage"
            namespace="/" theme="simple"
            action="templateMaker" method="post"
            enctype="multipart/form-data">
        <s:hidden name="projectName" id="projectName"/>
        <s:hidden name="sampleName" id="sampleName"/>
        <s:hidden name="eventName" id="eventName"/>
        <div id="HeaderPane">
    		<table cellpadding="0" cellspacing="0" border="0">
    			<tr><td class="panelHeader">Template Download</td></tr>
    			<tr>
    				<td>
    					<div id="errorMessagesPanel" style="margin-top:15px;"></div>
                        <s:if test="hasActionErrors()">
                            <input type="hidden" id="error_messages" value="<s:iterator value='actionErrors'><s:property/><br/></s:iterator>"/>
                        </s:if>
    				</td>
    			</tr>
    		</table>
        </div>
    	<div id="middle_content_template">
    		<div id="statusTableDiv">
    			<div id="tableTop">
    				<table>
                        <tr>
                            <s:div id="projectDropBox">
                                <td>Project</td>
                                <td style="padding-left:10px" class="ui-combobox"><s:select id="_projectSelect"
                                                  list="projectList" name="projectId" headerKey="0" headerValue=""
                                                  listValue="projectName" listKey="projectId" required="true"
                                    />
                                </td>
                            </s:div>
                        </tr>
                        <tr>
                            <s:div id="sampleDropBox">
                                <td id="sampleNameLabel">Sample</td>
                                <td style="padding-left:10px" class="ui-combobox"><s:select id="_sampleSelect" list="#{'0':''}"
                                                 name="sampleId" required="true" disabled="true"
                                    />
                                </td>
                            </s:div>
                        </tr>
                        <tr>
                            <s:div id="eventDropBox">
                                <td>Event</td>
                                <td style="padding-left:10px" class="ui-combobox"><s:select id="_eventSelect" list="#{'0':''}"
                                                name="eventId" required="true" disabled="true"
                                    />
                                </td>
                            </s:div>
                        </tr>
                    </table>
    			</div>
    		</div>
    		<s:div id="submitDiv" cssStyle="margin:15px 10px 5px 0;width:100%;">
                <input type="button" style="width:15%;" onclick="javascript:doSubmit();" id="downloadButton" value="Download" disabled="true"/>
    			<input type="button" style="margin-left:15px;" onclick="javascript:doClear();" value="Clear" />
            </s:div>
        </div>
    </s:form>
    </div><!-- end #content -->
</div><!-- end #main -->
<s:include value="globalJS.jsp" />
    <script src="scripts/jquery/jquery.dataTables.js"></script>
    <script>        
        function comboBoxChanged(option, id) {
            if(id==='_projectSelect') {
                $("#downloadButton").attr("disabled", true);
                if(option.value!=null && option.value!=0 && option.text!=null && option.text!='') {
                    projectChanged(option.value);
                } else {
                    $("#_sampleSelect").html(vs.empty);
                    $("#_eventSelect").html(vs.empty);
                }
            } else if(id==='_sampleSelect') {
                if(option.value!=null && option.value!=0 && option.text!=null && option.text!='') {
                    getEventType($('#_projectSelect').val(), option.value, 0);
                } 
            } else if(id==='_eventSelect') {
                if(option.value!=null && option.value!=0 && option.text!=null && option.text!='') {
                    $("#downloadButton").attr("disabled", false);
                }
            }
        }

        function projectChanged(projectId) {
            $("#_sampleSelect").attr("disabled", false);
            gethtmlByType("Sample", projectId, 0, 0);
            getEventType(projectId, 0, 0);
        }

        function getEventType(projectId, sampleId, eventId) {
            $("#_eventSelect").attr("disabled", false);
            gethtmlByType("Event", projectId, sampleId, eventId);
        }

        <!-- Generate html content using Ajax by type -->
        function gethtmlByType(ajaxType, projectId, sampleId, eventId) {
            $.ajax({
                url:"sharedAjax.action",
                cache: false,
                async: false,
                data: "type="+ajaxType+"&projectId="+projectId+"&sampleId="+sampleId+"&eventTypeId="+eventId,
                success: function(html){
                    if(ajaxType == "Sample") {
                        var list = vs.empty;
                        $.each(html.aaData, function(i1,v1) {
                            if(i1!=null && v1!=null) {
                                list += vs.vnoption.replace("$v$",v1.id).replace("$n$",v1.name);;
                            }
                        });

                        if(sampleId == null || sampleId == 0)
                            $("#_sampleSelect").html(list);

                    } else if(ajaxType == "Event") {
                        var list = vs.empty;

                        $.each(html, function(i) {
                            if(html[i] != null) {
                                $.each(html[i], function(j) {
                                    if(html[i][j] != null && html[i][j].lookupValueId != null && html[i][j].name != null) {
                                        list += '<option value="'+html[i][j].lookupValueId+'">' +html[i][j].name + '</option>';
                                    }
                                });
                            }
                        });

                        $("#_eventSelect").html(list);
                    }
                },
                fail: function(html) {
                    alert("Ajax Process has Failed.");
                }
            });
        }

        function doSubmit() {
            var docObj = document.uploadLoaderPage;
            $("#projectName").val($("#_projectSelect option:selected").text());
            $("#sampleName").val($("#_sampleSelect").val()==0?"--":$("#_sampleSelect option:selected").text());
            $("#eventName").val($("#_eventSelect option:selected").text());
            docObj.submit();
        }
        
        function doClear() {
            $("#_projectSelect").val(0);
            $("#_sampleSelect").val(0);
            $("#_eventSelect").val(0);
            $("#_sampleSelect").attr("disabled", true);
            $("#_eventSelect").attr("disabled", true);
            $("#downloadButton").attr("disabled", true);
        }

        
        $(document).ready(function() {
            $('select').combobox();

            var projectId = <s:if test="projectId == null">0</s:if><s:else><s:property value="projectId"/></s:else>;
            var sampleId = <s:if test="sampleId == null">0</s:if><s:else><s:property value="sampleId"/></s:else>;
            var eventId = <s:if test="eventId == null">0</s:if><s:else><s:property value="eventId"/></s:else>;
            if( projectId != null && projectId != 0) {
                $('#_projectSelect').val(projectId);
                projectChanged(projectId);
                if( sampleId != null && sampleId != 0) {
                    $('#_sampleSelect').val(sampleId);
                    //getEventType($('#_projectSelect').val(), $('#_sampleSelect').val(), 0);
                }
                if( eventId != null && eventId != 0) {
                    $('#_eventSelect').val(eventId);
                }
            }

            utils.error.check();
        });
    </script>
</body>
</html>
