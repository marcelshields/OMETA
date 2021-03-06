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
      tr.spacer > td {
        padding-top: 1em;
      }
    </style>
    <s:form id="addActorPage" name="addActorPage" namespace="/" action="addActor" method="post" theme="simple">
      <div id="HeaderPane" style="margin:15px 0 0 30px;">
        <div class="panelHeader">User Registration</div>
        <div id="errorMessagesPanel" style="margin-top:15px;"></div>
        <s:if test="hasActionErrors()">
          <input type="hidden" id="error_messages" value="<s:iterator value='actionErrors'><s:property/><br/></s:iterator>"/>
        </s:if>
        <s:if test="hasActionMessages()">
          <div class="alert_info" onclick="$('.alert_info').remove();">
            <strong><s:iterator value='actionMessages'><s:property/><br/></s:iterator></strong>
          </div>
        </s:if>
      </div>
      <div id="middle_content_template">
        <div id="statusTableDiv">
          <div style="margin:0 10px 0 0;">
            <h1 class="csc-firstHeader">Actor Information</h1>
          </div>
          <div id="tableTop">
            <table>
              <tr class="gappedTr">
                <td align="right">User ID</td>
                <td><s:textfield id="_usertName" name="actor.username" size="35px"/></td>
                <td style="padding-left:7px;"><strong>User ID must match your UNIX ID.</strong></td>
              </tr>
              <tr class="gappedTr">
                <td align="right">First Name</td>
                <td><s:textfield id="_firstName" name="actor.firstName" size="35px"/></td>
              </tr>
              <tr class="gappedTr">
                <td align="right">Middle Name</td>
                <td><s:textfield id="_middleName" name="actor.middleName" size="35px"/></td>
              </tr>
              <tr class="gappedTr">
                <td align="right">Last Name</td>
                <td><s:textfield id="_lastName" name="actor.lastName" size="35px"/></td>
              </tr>
              <tr class="gappedTr">
                <td align="right">Email</td>
                <td><s:textfield id="_email" name="actor.email" size="35px"/></td>
              </tr>
            </table>
          </div>
          <s:div id="submitDiv" cssStyle="margin:15px 10px 5px 200px;width:100%;">
            <input type="button" onclick="javascript:loadActor();" id="loadButton" value="Register"/>
            <input type="button" style="margin-left:15px;" onclick="javascript:doClear();" value="Clear" />
          </s:div>
        </div>
      </div>
    </s:form>
  </div><!-- end #content -->
</div><!-- end #main -->

<s:include value="globalJS.jsp" />
<script type="text/javascript">

  function loadActor() {
    if(!validateEmail()) {
      alert('Invalid email address');
      return;
    }
    $('form#addActorPage').submit();
  }

  function validateEmail() {
    var email = $('input#_email').val(), re = /\S+@\S+\.\S+/;
    return re.test(email);
  }

  function doClear() {
    $("#_usertName, #_firstName, #_lastName, #_middleName, #_email").val('');
  }

  utils.error.check();
</script>
</body>
</html>
