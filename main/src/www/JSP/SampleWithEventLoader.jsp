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

<%--
  Created by IntelliJ IDEA.
  User: hkim
  Date: 4/4/12
  Time: 8:47 AM
--%>
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
    </style>
    <s:form id="sampleLoaderPage" name="sampleLoaderPage"
            namespace="/"
            action="sampleWithEventLoader"
            method="post" theme="simple">
        <s:hidden name="jobType" id="jobType"/>
        <s:hidden name="label" id="label"/>
        <s:hidden name="eventName" id="eventName"/>
        <div id="HeaderPane">
            <table cellpadding="0" cellspacing="0" border="0">
                <tr><td class="panelHeader">Sample Loader</td></tr>
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
            <!--<div id="columnsTable"></div>  for column listing-->
            <div id="statusTableDiv">
                <div style="margin:0 10px 0 0;">
                    <h1 class="csc-firstHeader">Sample Information</h1>
                </div>
                <div id="tableTop">
                    <table>
                        <tr>
                            <td align="right" id="sampleNameLabel">Sample Name</td>
                            <td><s:textfield id="_sampleName" name="loadingSample.sampleName" size="35px"/></td>
                        </tr>
                        <tr><td style="padding-top:10px;"/></tr>
                        <tr>
                            <td align="right">Project</td>
                            <td class="ui-combobox">
                                <s:select id="_projectSelect"
                                          list="projectList" name="loadingSample.projectId" headerKey="0" headerValue="None"
                                          listValue="projectName" listKey="projectId" required="true" />
                            </td>
                        </tr>
                        <tr><td style="padding-top:10px;"/></tr>
                        <tr id="parentSelectTr">
                            <td align="right" id="parentSampleLabel">Parent Sample</td>
                            <td class="ui-combobox">
                                <s:select id="_parentSampleSelect" list="#{'0':''}" name="loadingSample.parentSampleId" required="true"/>
                            </td>
                        </tr>
                        <tr><td style="padding-top:10px;"/></tr>
                        <tr>
                            <td align="right">Public</td>
                            <td>
                                <s:select id="_isPublic" list="#{0:'No', 1:'Yes'}" name="loadingSample.isPublic" required="true" />
                            </td>
                        </tr>
                        <tr><td style="padding-top:10px;"/></tr>
                        </tr>
                            <s:div id="eventDropBox">
                                <td align="right">Event</td>
                                <td>
                                    <s:select id="_eventSelect" list="#{'0':' Type'}" name="eventId" required="true" disabled="true"/>
                                </td>
                            </s:div>
                        </tr>
                    </table>
                </div>
                <div id="attributeInputDiv" style="margin:25px 10px 0 0;border:1px solid;width:75%;">
                    <s:if test="beanList != null && beanList.size() > 0">
                        <table style="margin-top:15px;">
                            <s:iterator value="beanList" var="attrName" status="stat">
                                <tr><td>&nbsp;</td></tr>
                                <tr>
                                    <s:hidden name="beanList[%{#stat.index}].projectName" />
                                    <s:hidden name="beanList[%{#stat.index}].sampleName" />
                                    <s:hidden name="beanList[%{#stat.index}].attributeName" />
                                    <td align="right"><s:property value="attributeName"/></td>
                                    <td><s:textfield name="beanList[%{#stat.index}].attributeValue"/></td>
                                </tr>
                                <tr><td>&nbsp;</td></tr>
                            </s:iterator>
                        </table>
                    </s:if>
                </div>
                <s:div id="submitDiv" cssStyle="margin:15px 10px 5px 0;width:100%;">
                    <input type="button" onclick="javascript:loadSample();" id="sampleLoadButton" value="Load Data"/>
                    <input type="button" style="margin-left:15px;" onclick="javascript:doClear();" value="Clear" />
                </s:div>
            </div>
        </div>
    </s:form>
    </div><!-- end #content -->
</div><!-- end #main -->
<s:include value="globalJS.jsp" />
    
    <script>
        (function() {
            this.toggleParentSelect = function(disable) {
                $('#_parentSampleSelect').val(0);
                $('tr#parentSelectTr').toggle(disable);
            };
            this.projectChanged = function(projectId) {
                $("#sampleLoadButton, #_sampleSelect").attr("disabled", false);
                gethtmlByType("Sample", projectId);
                getEventType(projectId);
                toggleParentSelect(true);
            };
            this.eventTypeChanged = function() {
                getMetaAttrHtml("ea",
                    $("#_projectSelect option:selected").text(),
                    $("#_eventSelect option:selected").text());
                
            };
            this.loadSample = function() {
                var eventType = $("#_eventSelect option:selected").text();
                $("#jobType").val("insert");
                $("#eventName").val(eventType);
                
                //validation check for parent sample id
                if(eventType.indexOf("Person")!==-1 || eventType.indexOf("Sample")!==-1) {
                    if($("#_parentSampleSelect").val()==="0") {
                        alert("Please choose " + $('#parentSampleLabel').html());
                        return;
                    }
                }
                
                $('form').submit();
            };
            this.doClear = function() {
                $("#_projectSelect").val(0);
                $("#_eventSelect").val(0);
                $("#attributeInputDiv table").remove();  
            };
        }());
        
        function comboBoxChanged(option, id) {
            $("#eventLoadButton").attr("disabled", true);
            if(id==='_projectSelect') {
                $("div#attributeInputDiv").html('');
                if(option.value!=null && option.value!=0 && option.text!=null && option.text!='') {
                    projectChanged(option.value);
                    $('.ui-autocomplete-input').val('');
                } else {
                    $("#_sampleSelect").html(vs.empty);
                    $("#_eventSelect").html(vs.empty);
                }
            }
        }

        function getEventType(projectId) {
            gethtmlByType("Event", projectId);
        }

        <!-- Generate html content using Ajax by type -->
        function gethtmlByType(ajaxType, projectId) {
            var label=$('input:hidden#label').val(),
                level=label==='Person'?1:label==='Sample'?2:0;
            $.ajax({
                url:"sharedAjax.action",
                cache: false,
                async: false,
                data: "type="+ajaxType+"&projectId="+projectId+"&subType=S&sampleLevel="+level,
                success: function(html){
                    if(ajaxType == "Sample") {
                        var list = vs.empty;
                        $.each(html.aaData, function(i1,v1) {
                            if(i1!=null && v1!=null) {
                                list += vs.vnoption.replace("$v$",v1.id).replace("$n$",v1.name);
                            }
                        });
                        $("#_parentSampleSelect").html(list);
                    } else if(ajaxType == "Event") {
                        var list = '<option value=0>Type</option>';

                        $.each(html, function(i1,v1) {
                            if(v1 != null) {
                                $.each(v1, function(i2,v2) {
                                    if(v2 != null && v2.lookupValueId != null && v2.name != null) {
                                        list += vs.vnoption.replace("$v$",v2.lookupValueId).replace("$n$",v2.name);
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

        function getMetaAttrHtml(ajaxType, projectName, eventName) {
            var count = 0, content='', subcon, options;
            $.ajax({
                url:"sharedAjax.action",
                cache: false,
                async: false,
                data: "type="+ajaxType+"&projectName="+projectName+"&eventName="+eventName,
                success: function(html){
                    if(ajaxType == "ea") {
                        var content = '<table style="margin-top:15px;">';
                        $.each(html, function(i1, v1) {
                            if(v1 != null) {
                                $.each(v1, function(i2, v2) {
                                    if(v2 != null && v2.eventMetaAttributeId != null && v2.projectId != null) {
                                        content += '<tr><input type="hidden" value="'+projectName+'" name="beanList['+count+'].projectName">' +
                                            '<input type="hidden" value="'+v2.lookupValue.name+'" name="beanList['+count+'].attributeName">' +
                                            '<td align="right">'+v2.lookupValue.name + '</td>' +
                                            '<td>';
                                        if(v2.options!==null&&v2.options!=='') {
                                            subcon='<select id="'+v2.lookupValue.name+'" name="beanList['+count+'].attributeValue">';
                                            options=v2.options.split(';');
                                            $.each(options, function(i3,v3) {
                                                subcon+='<option value="'+v3+'">'+(v3==='1'?'Yes':v3==='0'?'No':v3)+'</option>';
                                            });
                                        } else {
                                            subcon='<input type="text" id="'+v2.lookupValue.name+'" name="beanList['+count+'].attributeValue"';
                                            var txtVal='';
                                            if(v2.requiredDB===0) {
                                                if(v2.dataType==='int')
                                                    txtVal='0';
                                                else if(v2.dataType==='string')
                                                    txtVal='none';
                                            }
                                            subcon+=' value="'+txtVal+'" /></td>';
                                        }
                                        content+=subcon+'</tr><tr><td>&nbsp;</td></tr>';
                                        count++;
                                    }
                                });
                            }
                        });
                        content += "</table>";
                        $("div#attributeInputDiv").html(content);
                        
                        utils.initDatePicker();
                    }
                },
                fail: function(html) {
                    alert("Ajax Process has Failed.");
                }
            });
        }

        $(document).ready(function() {
            $('#_eventSelect').attr('disabled', true);
            var label=$('input:hidden#label').val();            
            if(label!==null && label!=='') {
                $.each($('#_projectSelect').find('option'), function(i1,v1) {
                    if(v1.text===paramP) {
                        $('#_projectSelect').val(parseInt(v1.value));
                        projectChanged(v1.value);
                        $.each($('#_eventSelect').find('option'), function(i2,v2) {
                            if(v2.text.indexOf(label)!==-1 && v2.text.indexOf('Registration')!==-1) {
                                $('#_eventSelect').val(parseInt(v2.value));
                                eventTypeChanged();
                            }
                        });
                    }
                });
                labeling(label);
                if(label==='Family') {
                    toggleParentSelect(false);
                }
            }
            
            $('#_projectSelect').combobox();
            $('#_parentSampleSelect').combobox();

            //set values at failure
            var projectId = <s:if test="projectId == null">0</s:if><s:else><s:property value="projectId"/></s:else>;
            var parentSampleId = <s:if test="sampleId == null">0</s:if><s:else><s:property value="sampleId"/></s:else>;
            if( projectId != null && projectId != 0) {
                $('#_projectSelect').val(projectId);
                projectChanged(projectId);
                if( parentSampleId != null && parentSampleId != 0)
                    $('#_parentSampleSelect').val(parentSampleId);
                $("#sampleLoadButton").attr("disabled", false);
            }

            utils.error.check();
        });
    </script>
</body>
</html>
