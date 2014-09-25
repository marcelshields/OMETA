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
    <s:form id="statusPage" name="statusPage"
            namespace="/"
            action="sampleDetail"
            method="post" theme="simple">
        <s:hidden name="projectName" />
        <s:hidden name="attributesOnScreen" />
        <s:hidden name="attributes" />
        <s:if test="iss.equals(\"true\")">
            <link rel="stylesheet" href="style/main.css" />
            <link rel="stylesheet" href="style/version01.css" />
            <script src="scripts/jquery/jquery-1.7.2.js"></script>
            <script src="scripts/jquery/jquery-ui.js"></script>
            <script src="scripts/ometa.utils.js"></script>
        </s:if>
        <s:else>
            <div id="HeaderPane" style="margin:15px 0 0 30px;">
               <div class="panelHeader" style="margin:0;">Sample Detail</div>
            </div>
        </s:else>
        <div id="middle_content_template">
            <h1 class="csc-firstHeader">
                <s:if test="detailMap.get(\"Organism\")==null">
                    <s:property value="sample.sampleName" />
                </s:if>
                <s:else>
                    <s:property value="detailMap.Organism" />
                </s:else>
            </h1>
            <p></p>
            <div style="width:100%;">
                <table class="contenttable tablesorter" id="statusTable">
                    <thead>
                    <tr class="tableHeader">
                        <th style="width:25%;"><p>Event</p></th>
                        <th style="width:12%;"><p>Status</p></th>
                        <th style="width:45%;"><p>Description</p></th>
                        <th style="width:12%;"><p>Date</p></th>
                    </tr>
                    </thead>
                    <tbody>
                        <s:iterator value="detailMap.event" var="event">
                            <tr>
                                <td><p><s:property value="eventName"/></p></td>
                                <td><p><s:property value="eventStatus"/></p></td>
                                <td>
                                    <s:iterator value="eventAttr" var="eAttr">
                                        <s:if test="name!=null && value!=null">
                                            <p><s:property value="name" /> - <s:property value="value" escape="false"/></p>
                                        </s:if>
                                    </s:iterator>
                                </td>
                                <td>
                                    <p><s:property value="date"/></p>
                                </td>
                            </tr>
                        </s:iterator>
                    </tbody>
                </table>
            </div>
        </div>
    </s:form>
    </div><!-- end #content -->
</div><!-- end #main -->
<s:include value="globalJS.jsp" />
    
    <script src="scripts/jquery/jquery.dataTables.js"></script>
    <script>
        $(document).ready(function() {
            $('#statusTable tbody tr:even').addClass('even');
            $('#statusTable tbody tr:odd').addClass('odd');
        })
    </script>
</body>
</html>
